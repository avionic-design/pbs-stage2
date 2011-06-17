PACKAGE = gst-plugins-bad
VERSION = 0.10.22

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-cdaudio \
	--disable-examples \
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
	--disable-colorspace

ifneq ($(CONFIG_PACKAGE_LIBS_SDL_CORE),y)
conf-args += --disable-sdl
else
conf-args += \
	--with-sdl-prefix=$(SYSROOT)$(prefix)
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
