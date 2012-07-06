PACKAGE = gst-plugins-base
VERSION = 0.10.36

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--disable-examples

ifneq ($(PACKAGE_MULTIMEDIA_LIBVORBIS),y)
conf-args += \
	--disable-vorbis
endif
ifneq ($(PACKAGE_MULTIMEDIA_LIBOGG),y)
conf-args += \
	--disable-ogg
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/bin/gst-discoverer-0.10 \
	$(prefix)/lib/*.so.*
