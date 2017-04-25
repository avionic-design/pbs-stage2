PACKAGE = pixman
VERSION = 0.34.0
LICENSE = MIT

LOCATION = https://www.cairographics.org/releases
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
