PACKAGE = libxcb
VERSION = 1.0

LOCATION = http://xcb.freedesktop.org/dist

env += \
	DESTDIR=$(ROOTFS)

include packages/xorg/lib/Makefile

# FIXME: this is really ugly, but libtool keeps throwing away the --sysroot
#        parameter otherwise
CC += --sysroot $(ROOTFS)

