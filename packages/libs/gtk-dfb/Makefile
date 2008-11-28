PACKAGE = gtk+
VERSION = 2.14.5

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.14
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

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
	cd $(pkgtree) && autoreconf
	install -m 755 support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	install -m 755 support/config.guess $(pkgtree)/config.guess
	install -m 755 support/config.sub $(pkgtree)/config.sub
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

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

module = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/gtk-2.0/2.10.0
sover  = 0.1400.5

prunefiles = \
	$(prefix)/lib/libgtk-directfb-2.0.la \
	$(prefix)/lib/libgdk-directfb-2.0.la \
	$(prefix)/lib/libgdk_pixbuf-2.0.la \
	$(prefix)/lib/libgailutil.la \
	$(module)/libferret.la \
	$(module)/libgail.la \
	$(plugin)/immodules/im-inuktitut.la \
	$(plugin)/immodules/im-viqr.la \
	$(plugin)/immodules/im-am-et.la \
	$(plugin)/immodules/im-ipa.la \
	$(plugin)/immodules/im-cedilla.la \
	$(plugin)/immodules/im-ti-er.la \
	$(plugin)/immodules/im-thai.la \
	$(plugin)/immodules/im-multipress.la \
	$(plugin)/immodules/im-ti-et.la \
	$(plugin)/immodules/im-cyrillic-translit.la \
	$(plugin)/printbackends/libprintbackend-lpr.la \
	$(plugin)/printbackends/libprintbackend-file.la \
	$(plugin)/loaders/libpixbufloader-wbmp.la \
	$(plugin)/loaders/libpixbufloader-pcx.la \
	$(plugin)/loaders/libpixbufloader-bmp.la \
	$(plugin)/loaders/libpixbufloader-ico.la \
	$(plugin)/loaders/libpixbufloader-ani.la \
	$(plugin)/loaders/libpixbufloader-pnm.la \
	$(plugin)/loaders/libpixbufloader-tga.la \
	$(plugin)/loaders/libpixbufloader-png.la \
	$(plugin)/loaders/libpixbufloader-ras.la \
	$(plugin)/loaders/libpixbufloader-icns.la \
	$(plugin)/loaders/libpixbufloader-xpm.la \
	$(plugin)/loaders/libpixbufloader-xbm.la \
	$(plugin)/loaders/libpixbufloader-gif.la \
	$(plugin)/loaders/libpixbufloader-jpeg.la \
	$(plugin)/engines/libpixmap.la

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
	$(plugin)/engines/libpixmap.so \
	$(plugin)/immodules/im-am-et.so \
	$(plugin)/immodules/im-cedilla.so \
	$(plugin)/immodules/im-cyrillic-translit.so \
	$(plugin)/immodules/im-inuktitut.so \
	$(plugin)/immodules/im-ipa.so \
	$(plugin)/immodules/im-multipress.so \
	$(plugin)/immodules/im-thai.so \
	$(plugin)/immodules/im-ti-er.so \
	$(plugin)/immodules/im-ti-et.so \
	$(plugin)/immodules/im-viqr.so \
	$(plugin)/loaders/libpixbufloader-ani.so \
	$(plugin)/loaders/libpixbufloader-bmp.so \
	$(plugin)/loaders/libpixbufloader-gif.so \
	$(plugin)/loaders/libpixbufloader-icns.so \
	$(plugin)/loaders/libpixbufloader-ico.so \
	$(plugin)/loaders/libpixbufloader-jpeg.so \
	$(plugin)/loaders/libpixbufloader-pcx.so \
	$(plugin)/loaders/libpixbufloader-png.so \
	$(plugin)/loaders/libpixbufloader-pnm.so \
	$(plugin)/loaders/libpixbufloader-ras.so \
	$(plugin)/loaders/libpixbufloader-tga.so \
	$(plugin)/loaders/libpixbufloader-wbmp.so \
	$(plugin)/loaders/libpixbufloader-xbm.so \
	$(plugin)/loaders/libpixbufloader-xpm.so \
	$(plugin)/printbackends/libprintbackend-file.so \
	$(plugin)/printbackends/libprintbackend-lpr.so

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

