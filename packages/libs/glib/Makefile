PACKAGE = glib
VERSION = 2.20.0

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.20
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

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes

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

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libgio-2.0.la \
	$(prefix)/lib/libglib-2.0.la \
	$(prefix)/lib/libgmodule-2.0.la \
	$(prefix)/lib/libgobject-2.0.la \
	$(prefix)/lib/libgthread-2.0.la \

sover = 0.2000.0

stripfiles = \
	$(prefix)/bin/glib-genmarshal \
	$(prefix)/bin/gobject-query \
	$(prefix)/bin/gtester \
	$(prefix)/lib/libgthread-2.0.so.$(sover) \
	$(prefix)/lib/libgmodule-2.0.so.$(sover) \
	$(prefix)/lib/libgobject-2.0.so.$(sover) \
	$(prefix)/lib/libgio-2.0.so.$(sover) \
	$(prefix)/lib/libglib-2.0.so.$(sover)

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

