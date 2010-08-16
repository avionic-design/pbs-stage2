PACKAGE = libXi
VERSION = 1.3.2

ifeq ($(CONFIG_XORG_IEGD),y)
patchdir = $(pkgsrctree)/patches-$(VERSION)
VERSION = 1.2.1
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
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
