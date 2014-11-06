#!/bin/sh
# Check ncurses compatibility

# What library to link
ldflags_at()
{
	for ext in so a dylib ; do
		for lib in ncursesw ncurses curses ; do
			LIBRARY_PATH=$1 $cc -print-file-name=lib${lib}.${ext} | grep -q /
			if [ $? -eq 0 ]; then
				echo "${1+-Wl,-rpath=$1 }-l${lib}"
				return 0
			fi
		done
	done
	return 1
}

ldflags()
{
	for base in $TOOLCHAIN_BASE_PATH/lib "" ; do
		ldflags_at $base && exit
	done
	exit 1
}

# Where is ncurses.h?
ccflags_at()
{
	if [ -z "$1" ]; then
		return 1
	elif [ -f $1/include/ncurses/ncurses.h ]; then
		echo '-I'$1'/include -DCURSES_LOC="<ncurses/ncurses.h>"'
	elif [ -f $1/include/ncurses/curses.h ]; then
		echo '-I'$1'/include -DCURSES_LOC="<ncurses/curses.h>"'
	elif [ -f $1/include/ncursesw/curses.h ]; then
		echo '-I'$1'/include -DCURSES_LOC="<ncursesw/curses.h>"'
	elif [ -f $1/include/ncurses.h ]; then
		echo '-I'$1'/include -DCURSES_LOC="<ncurses.h>"'
	else
		return 1
	fi
}

ccflags()
{
	for base in $TOOLCHAIN_BASE_PATH /usr ; do
		ccflags_at $base && return
	done
	echo '-DCURSES_LOC="<curses.h>"'
}

# Temp file, try to clean up after us
tmp=.lxdialog.tmp
trap "rm -f $tmp" 0 1 2 3 15

# Check if we can link to ncurses
check() {
        $cc -xc - -o $tmp 2>/dev/null <<'EOF'
#include CURSES_LOC
main() {}
EOF
	if [ $? != 0 ]; then
	    echo " *** Unable to find the ncurses libraries or the"       1>&2
	    echo " *** required header files."                            1>&2
	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
	    echo " *** "                                                  1>&2
	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
	    echo " *** "                                                  1>&2
	    exit 1
	fi
}

usage() {
	printf "Usage: $0 [-check compiler options|-ccflags|-ldflags compiler options]\n"
}

if [ $# -eq 0 ]; then
	usage
	exit 1
fi

cc=""
case "$1" in
	"-check")
		shift
		cc="$@"
		check
		;;
	"-ccflags")
		ccflags
		;;
	"-ldflags")
		shift
		cc="$@"
		ldflags
		;;
	"*")
		usage
		exit 1
		;;
esac
