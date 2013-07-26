PACKAGE = gst-plugins-gles
VERSION = 0.10.4
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

CFLAGS += -UG_DISABLE_DEPRECATED

conf-args += \
	--with-gstreamer=1.0

plugin = $(prefix)/lib/gstreamer-1.0

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
