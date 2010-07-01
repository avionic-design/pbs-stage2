PACKAGE = gtk+
VERSION = 2.21.4

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.21
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-gdktarget=x11 \
	--disable-glibtest \
	--disable-cups

build-args += \
	GLIB_MKENUMS=$(ROOTFS)$(prefix)/bin/glib-mkenums

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0
sover  = 0.2104.0

prunefiles = \
	$(prefix)/lib/*.la \
	$(module)/*.la \
	$(plugin)/engines/*.la \
	$(plugin)/loaders/*.la \
	$(plugin)/immodules/*.la \
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
