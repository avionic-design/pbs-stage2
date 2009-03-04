PACKAGE = libxcb
VERSION = 1.2

LOCATION = http://xcb.freedesktop.org/dist
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = X C binding

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS) \
	DESTDIR=$(ROOTFS)

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
	cd $(pkgtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libxcb.la \
	$(prefix)/lib/libxcb-*.la

stripfiles = \
	$(prefix)/lib/libxcb.so.1.1.0 \
	$(prefix)/lib/libxcb-*.so.0.0.0

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

