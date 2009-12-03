PACKAGE = libXi
VERSION = 1.3

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libXi.la

stripfiles = \
	$(prefix)/lib/libXi.so.6.1.0
