PACKAGE = gstreamer
VERSION = 0.10.23

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-rpath

plugin = $(prefix)/lib/gstreamer-0.10
versuf = -0.10
sover  = 0.20.0

prunefiles = \
	$(plugin)/libgstcoreelements.la \
	$(plugin)/libgstcoreindexers.la \
	$(prefix)/lib/libgstbase$(versuf).la \
	$(prefix)/lib/libgstcontroller$(versuf).la \
	$(prefix)/lib/libgstdataprotocol$(versuf).la \
	$(prefix)/lib/libgstnet$(versuf).la \
	$(prefix)/lib/libgstreamer$(versuf).la

stripfiles = \
	$(prefix)/bin/gst-feedback \
	$(prefix)/bin/gst-inspect \
	$(prefix)/bin/gst-inspect$(versuf) \
	$(prefix)/bin/gst-launch \
	$(prefix)/bin/gst-launch$(versuf) \
	$(prefix)/bin/gst-typefind \
	$(prefix)/bin/gst-typefind$(versuf) \
	$(prefix)/bin/gst-xmlinspect \
	$(prefix)/bin/gst-xmlinspect$(versuf) \
	$(prefix)/bin/gst-xmllaunch \
	$(prefix)/bin/gst-xmllaunch$(versuf) \
	$(plugin)/libgstcoreelements.so \
	$(plugin)/libgstcoreindexers.so \
	$(prefix)/lib/libgstbase$(versuf).so.$(sover) \
	$(prefix)/lib/libgstcontroller$(versuf).so.$(sover) \
	$(prefix)/lib/libgstdataprotocol$(versuf).so.$(sover) \
	$(prefix)/lib/libgstnet$(versuf).so.$(sover) \
	$(prefix)/lib/libgstreamer$(versuf).so.$(sover)
