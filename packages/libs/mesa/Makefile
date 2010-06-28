PACKAGE = mesa
VERSION = 7.8.2
SOVER = 070802

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

dri-drivers-y := swrast
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_I810) += i810
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_I915) += i915
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_I965) += i965
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_MACH64) += mach64
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_MGA) += mga
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_R128) += r128
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_R200) += r200
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_R300) += r300
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_R600) += r600
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_RADEON) += radeon
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_SAVAGE) += savage
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_SIS) += sis
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_TDFX) += tdfx
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_UNICHROME) += unichrome
dri-drivers-$(CONFIG_PACKAGE_LIBS_MESA_DRI_FFB) += ffb

conf-args += \
	--with-dri-drivers="$(dri-drivers-y)" \
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
	$(prefix)/bin/corender \
	$(prefix)/bin/glsync \
	$(prefix)/bin/glthreads \
	$(prefix)/bin/glxcontexts \
	$(prefix)/bin/glxdemo \
	$(prefix)/bin/glxgears \
	$(prefix)/bin/glxgears_fbconfig \
	$(prefix)/bin/glxgears_pixmap \
	$(prefix)/bin/glxheads \
	$(prefix)/bin/glxinfo \
	$(prefix)/bin/glxpbdemo \
	$(prefix)/bin/glxpixmap \
	$(prefix)/bin/glxsnoop \
	$(prefix)/bin/glxswapcontrol \
	$(prefix)/bin/manywin \
	$(prefix)/bin/msctest \
	$(prefix)/bin/multictx \
	$(prefix)/bin/offset \
	$(prefix)/bin/omlsync \
	$(prefix)/bin/overlay \
	$(prefix)/bin/pbdemo \
	$(prefix)/bin/pbinfo \
	$(prefix)/bin/sharedtex \
	$(prefix)/bin/sharedtex_mt \
	$(prefix)/bin/texture_from_pixmap \
	$(prefix)/bin/wincopy \
	$(prefix)/bin/xfont \
	$(prefix)/bin/xrotfontdemo \
	$(prefix)/lib/libGL.so.1.2 \
	$(prefix)/lib/libGLU.so.1.3.$(SOVER) \
	$(prefix)/lib/libGLw.so.1.0.0 \
	$(prefix)/lib/dri/*.so

include packages/cleanup.mk
include packages/binary.mk
