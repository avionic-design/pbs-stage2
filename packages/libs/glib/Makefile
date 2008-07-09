PACKAGE = glib
VERSION = 2.17.2

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.17
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

_package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgio-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libglib-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgmodule-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgobject-2.0.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgthread-2.0.la

sover = 0.1702.0

libs-strip = \
	$(prefix)/lib/libgthread-2.0.so.$(sover) \
	$(prefix)/lib/libgmodule-2.0.so.$(sover) \
	$(prefix)/lib/libgobject-2.0.so.$(sover) \
	$(prefix)/lib/libgio-2.0.so.$(sover) \
	$(prefix)/lib/libglib-2.0.so.$(sover)

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

