PACKAGE = gst-plugins-gles
VERSION = 0.10.4

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	CFLAGS='-UG_DISABLE_DEPRECATED'

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_0_10_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
