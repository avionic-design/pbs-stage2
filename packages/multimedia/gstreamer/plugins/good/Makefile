PACKAGE = gst-plugins-good
VERSION = 0.10.30

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-aalib \
	--disable-annodex \
	--disable-esd \
	--disable-shout2

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
