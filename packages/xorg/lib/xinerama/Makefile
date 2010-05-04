PACKAGE = libXinerama
VERSION = 1.1
SOVER = 1.0.0

ifeq ($(CONFIG_XORG_IEGD),y)
patchdir = $(pkgsrctree)/patches-$(VERSION)
VERSION = 1.0.3
endif

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libXinerama.la

stripfiles = \
	$(prefix)/lib/libXinerama.so.$(SOVER)
