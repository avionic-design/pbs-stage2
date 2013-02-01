PACKAGE = gst-plugins-ugly
VERSION = 1.0.5
LICENSE = GPL LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_PLUGINS_FFMPEG),y)
conf-args += \
	--disable-mpeg2dec
endif

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_RARE),y)
conf-args += \
	--disable-asfdemux \
	--disable-dvdlpcmdec \
	--disable-dvdsub \
	--disable-xingmux \
	--disable-realmedia \
	--disable-a52dec \
	--disable-amrnb \
	--disable-amrwb \
	--disable-cdio \
	--disable-dvdread \
	--disable-lame \
	--disable-sidplay \
	--disable-twolame
endif

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
