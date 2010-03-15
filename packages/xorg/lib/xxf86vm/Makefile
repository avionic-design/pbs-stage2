PACKAGE = libXxf86vm
VERSION = 1.1.0

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libXxf86vm.la

stripfiles = \
	$(prefix)/lib/libXxf86vm.so.1.0.0
