PACKAGE = mesa
VERSION = 7.7
SOVER = 070700

ifeq ($(CONFIG_XORG_IEGD),y)
VERSION = 7.5.2
SOVER = 070502
endif

LOCATION = ftp://ftp.freedesktop.org/pub/mesa/$(VERSION)
TARBALLS = \
	MesaLib-$(VERSION).tar.bz2 \
	MesaDemos-$(VERSION).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/Mesa-$(VERSION)

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-args += \
	--with-dri-drivers=swrast \
	--with-demos=xdemos \
	--disable-gallium \
	--disable-egl

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/bin/glxdemo \
	$(prefix)/bin/glxgears \
	$(prefix)/bin/glxheads \
	$(prefix)/bin/glxinfo \
	$(prefix)/lib/libGL.so.1.2 \
	$(prefix)/lib/libGLU.so.1.3.$(SOVER) \
	$(prefix)/lib/libGLw.so.1.0.0 \
	$(prefix)/lib/dri/*.so

include packages/cleanup.mk
include packages/binary.mk
