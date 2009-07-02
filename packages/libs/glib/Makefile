PACKAGE = glib
VERSION = 2.21.2

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.21
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

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

prunefiles = \
	$(prefix)/lib/libgio-2.0.la \
	$(prefix)/lib/libglib-2.0.la \
	$(prefix)/lib/libgmodule-2.0.la \
	$(prefix)/lib/libgobject-2.0.la \
	$(prefix)/lib/libgthread-2.0.la \

sover = 0.2102.0

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

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
