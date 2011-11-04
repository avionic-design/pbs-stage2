PACKAGE = gst-ffmpeg
VERSION = 0.10.13

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--with-system-ffmpeg

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_PLUGINS_FFMPEG_ORC),y)
  conf-args += --enable-orc
  conf-vars += ORCC=orcc
else
  conf-args += --disable-orc
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
