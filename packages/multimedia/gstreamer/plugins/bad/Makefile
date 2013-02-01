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

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_RARE),y)
conf-args += \
	--disable-adpcmdec \
	--disable-adpcmenc \
	--disable-aiff \
	--disable-asfmux \
	--disable-audiovisualizers \
	--disable-bayer \
	--disable-camerabin2 \
	--disable-cdxaparse \
	--disable-dataurisrc \
	--disable-dccp \
	--disable-dtmf \
	--disable-dvbsuboverlay \
	--disable-dvdspu \
	--disable-faceoverlay \
	--disable-festival \
	--disable-fieldanalysis \
	--disable-freeverb \
	--disable-frei0r \
	--disable-gaudieffects \
	--disable-geometrictransform \
	--disable-gdp \
	--disable-hdvparse \
	--disable-hls \
	--disable-inter \
	--disable-ivfparse \
	--disable-jp2kdecimator \
	--disable-librfb \
	--disable-mpegpsmux \
	--disable-mve \
	--disable-mxf \
	--disable-nsf \
	--disable-nuvdemux \
	--disable-patchdetect \
	--disable-pcapparse \
	--disable-pnm \
	--disable-rawparse \
	--disable-real \
	--disable-removesilence \
	--disable-scaletempo \
	--disable-sdi \
	--disable-sdp \
	--disable-segmentclip \
	--disable-siren \
	--disable-smooth \
	--disable-speed \
	--disable-subenc \
	--disable-stereo \
	--disable-tta \
	--disable-vmnc \
	--disable-y4m \
	--disable-directsound \
	--disable-direct3d \
	--disable-directdraw \
	--disable-direct3d9 \
	--disable-directshow \
	--disable-android_media \
	--disable-apple_media \
	--disable-osx_video \
	--disable-avc \
	--disable-quicktime \
	--disable-vcd \
	--disable-opensles \
	--disable-uvch264 \
	--disable-assrender \
	--disable-voamrwbenc \
	--disable-voaacenc \
	--disable-apexsink \
	--disable-cdaudio \
	--disable-celt \
	--disable-chromaprint \
	--disable-cog \
	--disable-dc1394 \
	--disable-decklink \
	--disable-directfb \
	--disable-wayland \
	--disable-dts \
	--disable-resindvd \
	--disable-faad \
	--disable-fbdev \
	--disable-flite \
	--disable-jasper \
	--disable-kate \
	--disable-ladspa \
	--disable-lv2 \
	--disable-linsys \
	--disable-modplug \
	--disable-mimic \
	--disable-mpeg2enc \
	--disable-mpg123 \
	--disable-mplex \
	--disable-musepack \
	--disable-musicbrainz \
	--disable-mythtv \
	--disable-nas \
	--disable-ofa \
	--disable-opencv \
	--disable-pvr \
	--disable-rsvg \
	--disable-timidity \
	--disable-teletextdec \
	--disable-wildmidi \
	--disable-sdltest \
	--disable-sndfile \
	--disable-soundtouch \
	--disable-spc \
	--disable-gme \
	--disable-xvid \
	--disable-dvb \
	--disable-wininet \
	--disable-acm \
	--disable-vdpau \
	--disable-schro \
	--disable-zbar \
	--disable-spandsp \
	--disable-gsettings \
	--disable-schemas-compile \
	--disable-sndio
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
