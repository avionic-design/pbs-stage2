PACKAGE = gst-plugins-base
VERSION = 1.10.4
LICENSE = GPL LGPL

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-examples \
	--disable-rpath

ifneq ($(PACKAGE_MULTIMEDIA_LIBVORBIS),y)
conf-args += \
	--disable-vorbis
endif
ifneq ($(PACKAGE_MULTIMEDIA_LIBOGG),y)
conf-args += \
	--disable-ogg
endif

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_ORC),y)
  conf-vars += ORCC=orcc
  conf-args += --enable-orc
else
  conf-args += --disable-orc
endif

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_RARE),y)
conf-args += \
	--disable-adder \
	--disable-encoding \
	--disable-gio \
	--disable-xshm \
	--disable-cdparanoia \
	--disable-ivorbis \
	--disable-libvisual \
	--disable-oggtest \
	--disable-vorbistest \
	--disable-freetypetest
endif

plugin = $(prefix)/lib/gstreamer-1.0

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/bin/gst-discoverer-1.0 \
	$(prefix)/lib/*.so.*
endif
