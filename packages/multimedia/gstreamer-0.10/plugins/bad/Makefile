PACKAGE = gst-plugins-bad
VERSION = 0.10.23

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-fatal-warnings \
	--disable-cdaudio \
	--disable-examples \
	--disable-tests \
	--disable-gsettings \
	--disable-dvdnav \
	--disable-dvdspu \
	--disable-camerabin \
	--disable-camerabin2 \
	--disable-dvbsuboverlay \
	--disable-dtmf \
	--disable-fieldanalysis \
	--disable-gaudieffects \
	--disable-geometrictransform \
	--disable-colorspace \
	--disable-decklink \
	--disable-rsvg \
	--disable-hls \
	--disable-uvch264 \
	--disable-sdl

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
