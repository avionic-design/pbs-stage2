PACKAGE = gstreamer
VERSION = 1.10.3
LICENSE = LGPL

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib \
	--with-sysroot=$(SYSROOT) \
	--disable-rpath \
	--disable-examples \
	--disable-tests \
	--disable-check \
	--disable-benchmarks

plugin = $(prefix)/lib/gstreamer-1.0

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(prefix)/bin/gst-inspect-1.0 \
	$(prefix)/bin/gst-launch-1.0 \
	$(prefix)/bin/gst-stats-1.0 \
	$(prefix)/bin/gst-typefind-1.0 \
	$(plugin)/gst-plugin-scanner \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
