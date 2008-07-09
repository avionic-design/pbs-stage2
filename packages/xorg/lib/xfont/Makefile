PACKAGE = libXfont
VERSION = 1.3.2

include packages/xorg/lib/Makefile

#package-pre-configure:
#	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

conf-args += \
	--disable-freetype

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

package-post-install:
	$(priv) rm $(ROOTFS)$(prefix)/lib/libXfont.la

