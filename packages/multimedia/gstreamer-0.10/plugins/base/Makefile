PACKAGE = gst-plugins-base
VERSION = 0.10.36

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--disable-fatal-warnings \
	--disable-examples \
	--disable-test \
	--disable-docs \
	--disable-gnome_vfs

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_LIBVORBIS),y)
  conf-args += --disable-vorbis
endif
ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_LIBTREMOR),y)
  conf-args += --disable-ivorbis
endif
ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_LIBOGG),y)
  conf-args += --disable-ogg
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/bin/gst-discoverer-0.10 \
	$(prefix)/lib/*.so.*
endif
