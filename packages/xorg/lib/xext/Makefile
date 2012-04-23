PACKAGE = libXext
VERSION = 1.3.1

ifeq ($(CONFIG_XORG_IEGD),y)
patchdir = $(pkgsrctree)/patches-$(VERSION)
VERSION = 1.0.5
endif

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
