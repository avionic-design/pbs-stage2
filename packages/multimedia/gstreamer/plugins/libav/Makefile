PACKAGE = gst-libav
VERSION = 1.2.0
LICENSE = GPL LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--with-system-libav

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_ORC),y)
  conf-vars += ORCC=orcc
  conf-args += --enable-orc
else
  conf-args += --disable-orc
endif

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
