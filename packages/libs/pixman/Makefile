PACKAGE = pixman
VERSION = 0.17.2

LOCATION = http://xorg.freedesktop.org/releases/individual/lib
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--disable-arm-neon \
	--disable-arm-simd
endif

prunefiles = \
	$(prefix)/lib/libpixman-1.la

stripfiles = \
	$(prefix)/lib/libpixman-1.so.$(VERSION)
