PACKAGE = libX11
VERSION = 1.2.2

include packages/xorg/lib/common.mk

ifeq ($(CONFIG_LIBC),uclibc)
  conf-args += \
	--enable-malloc0returnsnull
else
  conf-args += \
	--disable-malloc0returnsnull
endif

prunefiles = \
	$(prefix)/lib/libX11-xcb.la \
	$(prefix)/lib/libX11.la

stripfiles = \
	$(prefix)/lib/libX11-xcb.so.1.0.0 \
	$(prefix)/lib/libX11.so.6.2.0
