PACKAGE = libXt
VERSION = 1.0.8

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

conf-vars += \
	CFLAGS_FOR_BUILD="-O2 -g" \
	LDFLAGS_FOR_BUILD=""

prunefiles = \
	$(prefix)/lib/libXt.la

stripfiles = \
	$(prefix)/lib/libXt.so.6.0.0
