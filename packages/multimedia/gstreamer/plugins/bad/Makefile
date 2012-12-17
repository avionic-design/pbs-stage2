PACKAGE = gst-plugins-bad
VERSION = 1.0.5
LICENSE = GPL LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-cdaudio \
	--disable-examples \
	--disable-gsettings \
	--disable-dvdspu \
	--disable-camerabin2 \
	--disable-dvbsuboverlay \
	--disable-dtmf \
	--disable-fieldanalysis \
	--disable-gaudieffects \
	--disable-geometrictransform \
	--disable-decklink \
	--disable-rsvg \
	--disable-hls

ifneq ($(CONFIG_PACKAGE_LIBS_SDL_CORE),y)
conf-args += --disable-sdl
else
conf-args += \
	--with-sdl-prefix=$(SYSROOT)$(prefix)
endif

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
