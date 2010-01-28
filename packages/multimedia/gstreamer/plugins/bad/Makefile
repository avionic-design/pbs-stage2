PACKAGE = gst-plugins-bad
VERSION = 0.10.17

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-dvdnav \
	--disable-sdl \
	--disable-x

plugin = $(prefix)/lib/gstreamer-0.10
sover  = 0.0.0

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.$(sover)
