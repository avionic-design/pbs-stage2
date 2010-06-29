PACKAGE = gstreamer
VERSION = 0.10.29

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib \
	--disable-rpath

versuf = 0.10
plugin = $(prefix)/lib/gstreamer-$(versuf)

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gst-feedback \
	$(prefix)/bin/gst-inspect \
	$(prefix)/bin/gst-inspect-$(versuf) \
	$(prefix)/bin/gst-launch \
	$(prefix)/bin/gst-launch-$(versuf) \
	$(prefix)/bin/gst-typefind \
	$(prefix)/bin/gst-typefind-$(versuf) \
	$(prefix)/bin/gst-xmlinspect \
	$(prefix)/bin/gst-xmlinspect-$(versuf) \
	$(prefix)/bin/gst-xmllaunch \
	$(prefix)/bin/gst-xmllaunch-$(versuf) \
	$(plugin)/gst-plugin-scanner \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
