PACKAGE = gst-plugins-base
VERSION = 0.10.25

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-ogg \
	--disable-pango \
	--disable-vorbis \
	--disable-x

plugin = $(prefix)/lib/gstreamer-0.10

sover = 0.18.0

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.$(sover)
