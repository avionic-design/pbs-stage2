PACKAGE = libXxf86vm
VERSION = 1.1.2

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
