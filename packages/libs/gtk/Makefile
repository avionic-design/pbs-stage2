PACKAGE = gtk+
VERSION = 2.17.4

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.17
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = The GTK+ graphical user interface library

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	cp $(srctree)/support/config.{guess,sub} $(pkgbuildtree)
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--with-gdktarget=x11 \
	--without-libjasper \
	--without-libtiff \
	--disable-cups

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	gio_can_sniff=yes

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	GLIB_MKENUMS=$(ROOTFS)$(prefix)/bin/glib-mkenums

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0
sover  = 0.1704.0

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

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install:
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
