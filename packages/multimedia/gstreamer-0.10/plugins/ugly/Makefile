PACKAGE = gst-plugins-ugly
VERSION = 0.10.19

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-fatal-warnings

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_PLUGINS_FFMPEG),y)
conf-args += \
	--disable-mpeg2dec
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
