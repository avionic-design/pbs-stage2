PACKAGE = gst-plugins-gles
VERSION = git

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--disable-examples

conf-vars += \
	CFLAGS='-UG_DISABLE_DEPRECATED'

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
