PACKAGE = gtk+
VERSION = 2.14.3

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
	--enable-shared \
	--enable-static \
	--enable-explicit-deps=yes \
	--disable-glibtest \
	--disable-debug \
	--disable-cups

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	install -m 755 support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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

mod-dir = $(prefix)/lib/gtk-2.0
sover = 0.1303.0

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgdk_pixbuf-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgdk-directfb-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgtk-directfb-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgailutil.la
	$(priv) find $(ROOTFS)$(mod-dir) -name '*.la' -exec rm {} +

find-modules = cd $(ROOTFS)$(mod-dir) 2> /dev/null && find -name '*.so'

libs-strip = \
	$(prefix)/lib/libgdk_pixbuf-2.0.so.$(sover) \
	$(prefix)/lib/libgdk-directfb-2.0.so.$(sover) \
	$(prefix)/lib/libgtk-directfb-2.0.so.$(sover) \
	$(prefix)/lib/libgailutil.so.18.0.1 \
	$(addprefix $(mod-dir)/, $(shell $(find-modules)))

libs-strip := $(patsubst %,strip-$(ROOTFS)%,$(libs-strip))

$(libs-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(libs-strip)
	@:

package-install: _install _strip
	@:

package-clean:
	@:

