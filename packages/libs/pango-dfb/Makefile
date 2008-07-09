PACKAGE = pango
VERSION = 1.21.3

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.21
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
	--without-x

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	install -m 755 support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

mod-dir = $(prefix)/lib/pango/1.6.0/modules

_package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libpango-1.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libpangocairo-1.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libpangoft2-1.0.la
	$(priv) rm $(ROOTFS)$(mod-dir)/*.la

sover = 0.2101.2

libs-strip = \
	$(prefix)/lib/libpangocairo-1.0.so.$(sover) \
	$(prefix)/lib/libpango-1.0.so.$(sover) \
	$(prefix)/lib/libpangoft2-1.0.so.$(sover) \
	$(mod-dir)/pango-arabic-lang.so \
	$(mod-dir)/pango-hangul-fc.so \
	$(mod-dir)/pango-indic-fc.so \
	$(mod-dir)/pango-tibetan-fc.so \
	$(mod-dir)/pango-khmer-fc.so \
	$(mod-dir)/pango-syriac-fc.so \
	$(mod-dir)/pango-arabic-fc.so \
	$(mod-dir)/pango-basic-fc.so \
	$(mod-dir)/pango-hebrew-fc.so \
	$(mod-dir)/pango-indic-lang.so \
	$(mod-dir)/pango-thai-fc.so

libs-strip := $(patsubst %,strip-$(ROOTFS)%,$(libs-strip))

$(libs-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(libs-strip)
	@:

package-install: _package-install _strip
	@:

package-clean:
	@:

