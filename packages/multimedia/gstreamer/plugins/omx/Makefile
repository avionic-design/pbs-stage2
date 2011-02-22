PACKAGE = gst-openmax
VERSION = 0.10.1

LOCATION = http://gstreamer.freedesktop.org/src/gst-openmax
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
