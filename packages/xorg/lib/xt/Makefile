PACKAGE = libXt
VERSION = 1.0.9

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
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
