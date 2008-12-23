PACKAGE = libxcb
VERSION = 1.1.93

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
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	cd $(pkgtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libxcb.la \
	$(prefix)/lib/libxcb-composite.la \
	$(prefix)/lib/libxcb-damage.la \
	$(prefix)/lib/libxcb-dpms.la \
	$(prefix)/lib/libxcb-glx.la \
	$(prefix)/lib/libxcb-randr.la \
	$(prefix)/lib/libxcb-record.la \
	$(prefix)/lib/libxcb-render.la \
	$(prefix)/lib/libxcb-res.la \
	$(prefix)/lib/libxcb-screensaver.la \
	$(prefix)/lib/libxcb-shape.la \
	$(prefix)/lib/libxcb-shm.la \
	$(prefix)/lib/libxcb-sync.la \
	$(prefix)/lib/libxcb-xevie.la \
	$(prefix)/lib/libxcb-xf86dri.la \
	$(prefix)/lib/libxcb-xfixes.la \
	$(prefix)/lib/libxcb-xinerama.la \
	$(prefix)/lib/libxcb-xprint.la \
	$(prefix)/lib/libxcb-xtest.la \
	$(prefix)/lib/libxcb-xv.la \
	$(prefix)/lib/libxcb-xvmc.la

stripfiles = \
	$(prefix)/lib/libxcb.so.1.1.0 \
	$(prefix)/lib/libxcb-composite.so.0.0.0 \
	$(prefix)/lib/libxcb-damage.so.0.0.0 \
	$(prefix)/lib/libxcb-dpms.so.0.0.0 \
	$(prefix)/lib/libxcb-glx.so.0.0.0 \
	$(prefix)/lib/libxcb-randr.so.0.0.0 \
	$(prefix)/lib/libxcb-record.so.0.0.0 \
	$(prefix)/lib/libxcb-render.so.0.0.0 \
	$(prefix)/lib/libxcb-res.so.0.0.0 \
	$(prefix)/lib/libxcb-screensaver.so.0.0.0 \
	$(prefix)/lib/libxcb-shape.so.0.0.0 \
	$(prefix)/lib/libxcb-shm.so.0.0.0 \
	$(prefix)/lib/libxcb-sync.so.0.0.0 \
	$(prefix)/lib/libxcb-xevie.so.0.0.0 \
	$(prefix)/lib/libxcb-xf86dri.so.0.0.0 \
	$(prefix)/lib/libxcb-xfixes.so.0.0.0 \
	$(prefix)/lib/libxcb-xinerama.so.0.0.0 \
	$(prefix)/lib/libxcb-xprint.so.0.0.0 \
	$(prefix)/lib/libxcb-xtest.so.0.0.0 \
	$(prefix)/lib/libxcb-xv.so.0.0.0 \
	$(prefix)/lib/libxcb-xvmc.so.0.0.0

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

