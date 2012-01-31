PACKAGE = gtk+
VERSION = 2.24.9

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--with-gdktarget=x11 \
	--disable-glibtest \
	--disable-cups

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0

prunefiles = \
	$(prefix)/lib/*.la \
	$(module)/*.la \
	$(plugin)/engines/*.la \
	$(plugin)/immodules/*.la \
	$(plugin)/loaders/*.la \
	$(plugin)/printbackends/*.la

stripfiles = \
	$(prefix)/bin/gdk-pixbuf-csource \
	$(prefix)/bin/gdk-pixbuf-query-loaders \
	$(prefix)/bin/gtk-query-immodules-2.0 \
	$(prefix)/bin/gtk-demo \
	$(prefix)/bin/gtk-update-icon-cache \
	$(prefix)/lib/*.so.* \
	$(module)/*.so \
	$(plugin)/engines/*.so \
	$(plugin)/immodules/*.so \
	$(plugin)/loaders/*.so \
	$(plugin)/printbackends/*.so
