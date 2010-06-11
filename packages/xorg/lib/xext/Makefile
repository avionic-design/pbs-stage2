PACKAGE = libXext
VERSION = 1.1.2
SOVER = 6.4.0

ifeq ($(CONFIG_XORG_IEGD),y)
patchdir = $(pkgsrctree)/patches-$(VERSION)
VERSION = 1.0.5
endif

include packages/xorg/lib/common.mk

conf-args += \
	--disable-malloc0returnsnull

prunefiles = \
	$(prefix)/lib/libXext.la

stripfiles = \
	$(prefix)/lib/libXext.so.$(SOVER)
