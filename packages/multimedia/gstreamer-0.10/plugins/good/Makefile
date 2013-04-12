PACKAGE = gst-plugins-good
VERSION = 0.10.31

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-fatal-warnings \
	--disable-examples \
	--disable-tests \
	--disable-aalib \
	--disable-annodex \
	--disable-esd \
	--disable-shout2

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
