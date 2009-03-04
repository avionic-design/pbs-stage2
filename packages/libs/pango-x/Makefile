PACKAGE = pango
VERSION = 1.23.0

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.23
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = Layout and rendering of internationalized text

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

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
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

plugin = $(prefix)/lib/pango/1.6.0/modules

prunefiles = \
	$(prefix)/lib/libpango-1.0.la \
	$(prefix)/lib/libpangocairo-1.0.la \
	$(prefix)/lib/libpangoft2-1.0.la \
	$(prefix)/lib/libpangox-1.0.la \
	$(plugin)/*.la

sover = 0.2300.0

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/libpangocairo-1.0.so.$(sover) \
	$(prefix)/lib/libpango-1.0.so.$(sover) \
	$(prefix)/lib/libpangoft2-1.0.so.$(sover) \
	$(prefix)/lib/libpangox-1.0.so.$(sover) \
	$(plugin)/*.so

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

