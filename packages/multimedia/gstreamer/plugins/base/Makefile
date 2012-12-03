PACKAGE = gst-plugins-base
VERSION = 1.0.5
LICENSE = GPL LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--disable-examples \
	--disable-orc

ifneq ($(PACKAGE_MULTIMEDIA_LIBVORBIS),y)
conf-args += \
	--disable-vorbis
endif
ifneq ($(PACKAGE_MULTIMEDIA_LIBOGG),y)
conf-args += \
	--disable-ogg
endif

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/bin/gst-discoverer-$(MAJOR).$(MINOR) \
	$(prefix)/lib/*.so.*
endif
