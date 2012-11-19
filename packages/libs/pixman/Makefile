PACKAGE = pixman
VERSION = 0.28.2
LICENSE = MIT

LOCATION = http://xorg.freedesktop.org/releases/individual/lib
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: $(pkgbuildtree)/m4

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--disable-arm-iwmmxt \
	--disable-arm-neon \
	--disable-arm-simd
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
