PACKAGE = gtk+
VERSION = 3.6.0
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--enable-x11-backend \
	--disable-glibtest \
	--disable-cups

plugin = $(prefix)/lib/gtk-3.0/3.0.0

prunefiles = \
	$(plugin)/immodules/*.la \
	$(plugin)/printbackends/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gtk3-demo \
	$(prefix)/bin/gtk3-demo-application \
	$(prefix)/bin/gtk3-widget-factory \
	$(prefix)/bin/gtk-query-immodules-3.0 \
	$(prefix)/bin/gtk-update-icon-cache \
	$(plugin)/immodules/*.so \
	$(plugin)/printbackends/*.so \
	$(prefix)/lib/*.so.*
