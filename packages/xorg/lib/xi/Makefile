PACKAGE = libXi
VERSION = 1.7.9
LICENSE = custom

ifneq ($(MAKECMDGOALS),watch)
  ifeq ($(CONFIG_XORG_IEGD),y)
  VERSION = 1.2.1
  endif
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
