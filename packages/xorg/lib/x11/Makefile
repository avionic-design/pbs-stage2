PACKAGE = libX11
VERSION = 1.6.2
LICENSE = MIT X

include packages/xorg/lib/common-reconf.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

conf-vars += \
	CPPFLAGS_FOR_BUILD='-idirafter $(SYSROOT)$(prefix)/include'

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
