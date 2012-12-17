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

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
