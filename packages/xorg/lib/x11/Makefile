PACKAGE = libX11
VERSION = 1.1.4

include packages/xorg/lib/Makefile

conf-args += \
	--disable-malloc0returnsnull

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

package-post-install:
	$(priv) rm $(ROOTFS)$(prefix)/lib/libX11-xcb.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libX11.la

