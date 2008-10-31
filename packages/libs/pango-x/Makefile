PACKAGE = pango
VERSION = 1.22.2

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.22
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

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
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

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

plugin = $(prefix)/lib/pango/1.6.0/modules

prunefiles = \
	$(prefix)/lib/libpango-1.0.la \
	$(prefix)/lib/libpangocairo-1.0.la \
	$(prefix)/lib/libpangoft2-1.0.la \
	$(prefix)/lib/libpangox-1.0.la \
	$(plugin)/pango-arabic-fc.la \
	$(plugin)/pango-arabic-lang.la \
	$(plugin)/pango-basic-fc.la \
	$(plugin)/pango-basic-x.la \
	$(plugin)/pango-hangul-fc.la \
	$(plugin)/pango-hebrew-fc.la \
	$(plugin)/pango-indic-fc.la \
	$(plugin)/pango-indic-lang.la \
	$(plugin)/pango-khmer-fc.la \
	$(plugin)/pango-syriac-fc.la \
	$(plugin)/pango-thai-fc.la \
	$(plugin)/pango-tibetan-fc.la

sover = 0.2202.0

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/libpangocairo-1.0.so.$(sover) \
	$(prefix)/lib/libpango-1.0.so.$(sover) \
	$(prefix)/lib/libpangoft2-1.0.so.$(sover) \
	$(prefix)/lib/libpangox-1.0.so.$(sover) \
	$(plugin)/pango-arabic-fc.so \
	$(plugin)/pango-arabic-lang.so \
	$(plugin)/pango-basic-fc.so \
	$(plugin)/pango-basic-x.so \
	$(plugin)/pango-hangul-fc.so \
	$(plugin)/pango-hebrew-fc.so \
	$(plugin)/pango-indic-fc.so \
	$(plugin)/pango-indic-lang.so \
	$(plugin)/pango-khmer-fc.so \
	$(plugin)/pango-syriac-fc.so \
	$(plugin)/pango-thai-fc.so \
	$(plugin)/pango-tibetan-fc.so

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

