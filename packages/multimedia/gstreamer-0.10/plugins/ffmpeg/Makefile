PACKAGE = gst-ffmpeg
VERSION = 0.10.13

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-fatal-warnings \
	--disable-tests \
	--with-system-ffmpeg

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_PLUGINS_FFMPEG_ORC),y)
  conf-vars += ORCC=$(objtree)/build-tools/bin/orcc
  conf-args += --enable-orc
else
  conf-args += --disable-orc
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
