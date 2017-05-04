#!/bin/sh
#
# PBS package watcher, a simple script trying to check each and every package
# for available updates. Creates an 'allyesconfig' based on a sane config
# snippet to start with and executes the 'watch' target on all of them. Reports
# a summary when everything is done. Defaults to the number of available cores
# for parallel processing, but since 'watching' just involves a couple network
# pings and a bit of Python, a lot more of jobs works just as well. Optionally
# takes the number of jobs as argument - if you want to see what a big load
# average on your machine looks like, try 1k or more.
#
# 2017, Bert van Hall, Avionic Design GmbH
#

build=$(mktemp -d)
statefile=$(mktemp)
kreleasedir='build/packages/kernel/linux/build/include/config'
cores=$(cat /proc/cpuinfo | grep '^processor' | wc -l)
[ -n "$1" ] && [ "$1" -ge 0 ] && cores="$1"
[ -z "$cores" ] && cores=1

echo "PBS packages watcher ($cores parallel jobs)"
echo

mkdir -p "$build/$kreleasedir"
uname -r > "$build/$kreleasedir/kernel.release" 2>/dev/null

cat <<EOF > "$build"/watchconfig
CONFIG_SHELL="/bin/sh"
CONFIG_ARCH_X86=y
CONFIG_MARCH="i686"
CONFIG_VENDOR="pc"
CONFIG_ARCH_HAS_HARD_FLOAT=y
CONFIG_ARCH="x86"
CONFIG_MACHINE="i786"
CONFIG_ARCH_X86_I786=y
CONFIG_OS_LINUX=y
CONFIG_OS="linux"
CONFIG_GLIBC=y
CONFIG_PLATFORM_GENERIC=y
EOF

make O="$build" KCONFIG_ALLCONFIG=watchconfig allyesconfig
make -j$cores O="$build" watch | tee $statefile

failed=$(grep failed $statefile | wc -l)
missing=$(grep watchfile $statefile | wc -l)
uptodate=$(grep up-to-date $statefile | wc -l)
available=$(grep available $statefile | wc -l)
all=$((failed+missing+uptodate+available))

echo '==============================='
echo "$all packages, of which $uptodate are in the latest version."
echo "$available packages can be updated."
echo "$missing are lacking a watchfile, $failed failed to scan."

rm -r $build
rm $statefile
