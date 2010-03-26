PACKAGE = libXp
VERSION = 1.0.0

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libXp.la

stripfiles = \
	$(prefix)/lib/libXp.so.6.2.0
