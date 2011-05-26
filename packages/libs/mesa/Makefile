PACKAGE = mesa
VERSION = 7.10.2

ifeq ($(CONFIG_XORG_IEGD),y)
VERSION = 7.5.2
endif

LOCATION = ftp://ftp.freedesktop.org/pub/mesa/$(VERSION)
TARBALLS = MesaLib-$(VERSION).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/Mesa-$(VERSION)

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(SYSROOT)

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
	--disable-gallium

ifeq ($(CONFIG_PACKAGE_LIBS_MESA_GL_EGL),y)
	conf-args += --enable-egl
else
	conf-args += --disable-egl
endif
ifeq ($(CONFIG_PACKAGE_LIBS_MESA_GL_ESV1),y)
	conf-args += --enable-gles1
else
	conf-args += --disable-gles1
endif
ifeq ($(CONFIG_PACKAGE_LIBS_MESA_GL_ESV2),y)
	conf-args += --enable-gles2
else
	conf-args += --disable-gles2
endif
ifeq ($(CONFIG_PACKAGE_LIBS_MESA_GL_OGL),y)
	conf-args += --enable-opengl
else
	conf-args += --disable-opengl
endif

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/dri/*.so \
	$(prefix)/lib/egl/*.so

include packages/cleanup.mk
include packages/binary.mk
