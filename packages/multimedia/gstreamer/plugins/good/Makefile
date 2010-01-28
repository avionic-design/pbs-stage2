PACKAGE = gst-plugins-good
VERSION = 0.10.17

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-aalib \
	--disable-annodex \
	--disable-esd \
	--disable-gst_v4l2 \
	--disable-shout2 \
	--disable-x

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
