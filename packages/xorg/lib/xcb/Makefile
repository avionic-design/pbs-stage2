PACKAGE = libxcb
VERSION = 1.1

LOCATION = http://xcb.freedesktop.org/dist

include packages/xorg/lib/Makefile

env += \
	DESTDIR=$(ROOTFS)

# FIXME: this is really ugly, but libtool keeps throwing away the --sysroot
#        parameter otherwise
conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

#env += \
	CC='$(CC) --sysroot $(ROOTFS)'

package-post-install:
	$(priv) rm $(ROOTFS)$(prefix)/lib/libxcb-*.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libxcb.la

