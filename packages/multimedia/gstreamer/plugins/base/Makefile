PACKAGE = gst-plugins-base
VERSION = 0.10.23

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-vorbis \
	--disable-ogg

plugin = $(prefix)/lib/gstreamer-0.10

sover = 0.16.0

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.$(sover)
