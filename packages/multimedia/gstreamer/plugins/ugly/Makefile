PACKAGE = gst-plugins-ugly
VERSION = 0.10.19

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_PLUGINS_FFMPEG),y)
conf-args += \
	--disable-mpeg2dec
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
