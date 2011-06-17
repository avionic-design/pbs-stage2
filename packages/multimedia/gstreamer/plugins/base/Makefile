PACKAGE = gst-plugins-base
VERSION = 0.10.34

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-examples \
	--disable-vorbis \
	--disable-ogg

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/bin/gst-discoverer-0.10 \
	$(prefix)/bin/gst-visualise-0.10 \
	$(prefix)/lib/*.so.*
