PACKAGE = gtk+
VERSION = 2.20.1

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.20
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-gdktarget=x11 \
	--without-libjasper \
	--without-libtiff \
	--disable-glibtest \
	--disable-cups

conf-vars += \
	gio_can_sniff=yes

build-args += \
	GLIB_MKENUMS=$(ROOTFS)$(prefix)/bin/glib-mkenums

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0
sover  = 0.2000.1

prunefiles = \
	$(prefix)/lib/libgtk-x11-2.0.la \
	$(prefix)/lib/libgdk-x11-2.0.la \
	$(prefix)/lib/libgdk_pixbuf-2.0.la \
	$(prefix)/lib/libgdk_pixbuf_xlib-2.0.la \
	$(prefix)/lib/libgailutil.la \
	$(module)/libferret.la \
	$(module)/libgail.la \
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
	$(prefix)/lib/libgailutil.so.18.0.1 \
	$(prefix)/lib/libgdk-x11-2.0.so.$(sover) \
	$(prefix)/lib/libgdk_pixbuf-2.0.so.$(sover) \
	$(prefix)/lib/libgdk_pixbuf_xlib-2.0.so.$(sover) \
	$(prefix)/lib/libgtk-x11-2.0.so.$(sover) \
	$(module)/libferret.so \
	$(module)/libgail.so \
	$(plugin)/engines/*.so \
	$(plugin)/immodules/*.so \
	$(plugin)/loaders/*.so \
	$(plugin)/printbackends/*.so
