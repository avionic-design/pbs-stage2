PACKAGE = gtk+
VERSION = 2.15.5

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.15
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = The GTK+ graphical user interface library

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--with-gdktarget=directfb \
	--without-libjasper \
	--without-libtiff \
	--with-xinput=no \
	--disable-cups

conf-vars = \
	CC="$(CC) --sysroot $(ROOTFS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)" \
	gio_can_sniff=yes

package-configure:
	cp support/config.{guess,sub} $(pkgtree)
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	GLIB_MKENUMS=$(ROOTFS)$(prefix)/bin/glib-mkenums

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0
sover  = 0.1505.0

prunefiles = \
	$(prefix)/lib/libgtk-directfb-2.0.la \
	$(prefix)/lib/libgdk-directfb-2.0.la \
	$(prefix)/lib/libgdk_pixbuf-2.0.la \
	$(prefix)/lib/libgailutil.la \
	$(module)/libferret.la \
	$(module)/libgail.la \
	$(plugin)/engines/*.la \
	$(plugin)/immodules/*.la \
	$(plugin)/loaders/*.la \
	$(plugin)/printbackends/*.la

stripfiles = \
	$(prefix)/bin/gdk-pixbuf-csource \
	$(prefix)/bin/gdk-pixbuf-query-loaders \
	$(prefix)/bin/gtk-query-immodules-2.0 \
	$(prefix)/bin/gtk-update-icon-cache \
	$(prefix)/lib/libgailutil.so.18.0.1 \
	$(prefix)/lib/libgdk-directfb-2.0.so.$(sover) \
	$(prefix)/lib/libgdk_pixbuf-2.0.so.$(sover) \
	$(prefix)/lib/libgtk-directfb-2.0.so.$(sover) \
	$(module)/libferret.so \
	$(module)/libgail.so \
	$(plugin)/engines/*.so \
	$(plugin)/immodules/*.so \
	$(plugin)/loaders/*.so \
	$(plugin)/printbackends/*.so

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

