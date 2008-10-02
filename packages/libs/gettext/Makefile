PACKAGE = gettext
VERSION = 0.17

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

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
	--disable-openmp \
	--disable-rpath

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libasprintf.la \
	$(prefix)/lib/libgettextlib.la \
	$(prefix)/lib/libgettextpo.la \
	$(prefix)/lib/libgettextsrc.la \
	$(prefix)/lib/libintl.la

po-version   = 0.4.0
intl-version = 8.0.2
plugin       = $(prefix)/lib/gettext

stripfiles = \
	$(prefix)/bin/envsubst \
	$(prefix)/bin/gettext \
	$(prefix)/bin/msgattrib \
	$(prefix)/bin/msgcat \
	$(prefix)/bin/msgcmp \
	$(prefix)/bin/msgcomm \
	$(prefix)/bin/msgconv \
	$(prefix)/bin/msgen \
	$(prefix)/bin/msgexec \
	$(prefix)/bin/msgfilter \
	$(prefix)/bin/msgfmt \
	$(prefix)/bin/msggrep \
	$(prefix)/bin/msginit \
	$(prefix)/bin/msgmerge \
	$(prefix)/bin/msgunfmt \
	$(prefix)/bin/msguniq \
	$(prefix)/bin/ngettext \
	$(prefix)/bin/recode-sr-latin \
	$(prefix)/bin/xgettext \
	$(prefix)/lib/libasprintf.so.0.0.0 \
	$(prefix)/lib/libgettextlib-$(VERSION).so \
	$(prefix)/lib/libgettextpo.so.$(po-version) \
	$(prefix)/lib/libgettextsrc-$(VERSION).so \
	$(prefix)/lib/libintl.so.$(intl-version) \
	$(plugin)/hostname \
	$(plugin)/urlget

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

