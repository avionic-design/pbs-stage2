PACKAGE = gstreamer
VERSION = 1.0.7
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

env += FATAL_WARNINGS=no

conf-args += \
	--libexecdir=$(prefix)/lib \
	--with-sysroot=$(SYSROOT) \
	--disable-rpath \
	--disable-examples \
	--disable-tests \
	--disable-check

conf-vars += \
	ac_cv_func_register_printf_specifier=no \
	ac_cv_func_register_printf_function=no

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(prefix)/bin/gst-feedback \
	$(prefix)/bin/gst-inspect \
	$(prefix)/bin/gst-inspect-$(MAJOR).$(MINOR) \
	$(prefix)/bin/gst-launch \
	$(prefix)/bin/gst-launch-$(MAJOR).$(MINOR) \
	$(prefix)/bin/gst-typefind \
	$(prefix)/bin/gst-typefind-$(MAJOR).$(MINOR) \
	$(prefix)/bin/gst-xmlinspect \
	$(prefix)/bin/gst-xmlinspect-$(MAJOR).$(MINOR) \
	$(prefix)/bin/gst-xmllaunch \
	$(prefix)/bin/gst-xmllaunch-$(MAJOR).$(MINOR) \
	$(plugin)/gst-plugin-scanner \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
endif
