PACKAGE = libXt
VERSION = 1.0.7

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libXt.la

stripfiles = \
	$(prefix)/lib/libXt.so.6.0.0
