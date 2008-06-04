PACKAGE = libX11
VERSION = 1.1.4

include packages/xorg/lib/Makefile

env += \
	DESTDIR=$(ROOTFS)

conf-args += \
	--disable-malloc0returnsnull \
	--without-xcb

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

