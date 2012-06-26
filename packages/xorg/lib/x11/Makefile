PACKAGE = libX11
VERSION = 1.5.0
LICENSE = MIT X

include packages/xorg/lib/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

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
