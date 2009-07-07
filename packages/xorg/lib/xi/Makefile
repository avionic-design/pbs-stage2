PACKAGE = libXi
VERSION = 1.2.1

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
	$(prefix)/lib/libXi.so.6.0.0
