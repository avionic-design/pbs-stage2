PACKAGE = libXfont
VERSION = 1.3.2

include packages/xorg/lib/Makefile

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

conf-args += \
	--disable-freetype

