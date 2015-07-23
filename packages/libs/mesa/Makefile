PACKAGE = mesa
VERSION = 10.5.8
LICENSE = custom

ifeq ($(CONFIG_XORG_IEGD),y)
VERSION = 7.5.2
endif

LOCATION = ftp://ftp.freedesktop.org/pub/mesa/$(VERSION)
TARBALLS = mesa-$(VERSION).tar.xz

ifneq ($(wildcard $(objtree)/source/$(obj)),)
VERSION = git
endif

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.autoreconfigure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) autoreconf --install --force $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

pkgbuildtree := $(pkgtree)/mesa-$(VERSION)

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc \
	--with-sysroot=$(SYSROOT)

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

dri-drivers-y := $(subst $(empty) $(empty),$(comma),$(dri-drivers-y))

conf-args += \
	--without-gallium-drivers \
	--enable-shared-glapi

ifeq ($(CONFIG_OPENGL_MESA_OPENGL),y)
conf-args += \
	--with-dri-drivers='$(dri-drivers-y)'
endif

ifneq ($(CONFIG_PACKAGE_LIBS_MESA_GBM),y)
  conf-args += --disable-gbm
else
  conf-args += --enable-gbm
endif

ifeq ($(CONFIG_OPENGL_MESA_EGL),y)
  conf-args += --enable-egl

  ifeq ($(CONFIG_PACKAGE_LIBS_MESA_WAYLAND),y)
    conf-args += --with-egl-platforms=x11,wayland,drm
  else
    conf-args += --with-egl-platforms=x11,drm
  endif

  # the EGL drm platform needs gbm, so enable it if it hasn't already been
  # explicitly selected
  ifneq ($(CONFIG_PACKAGE_LIBS_MESA_GBM),y)
    conf-args += --enable-gbm
  endif
else
  conf-args += --disable-egl
endif
ifeq ($(CONFIG_OPENGL_MESA_OPENGL_ES1),y)
	conf-args += --enable-gles1
else
	conf-args += --disable-gles1
endif
ifeq ($(CONFIG_OPENGL_MESA_OPENGL_ES2),y)
	conf-args += --enable-gles2
else
	conf-args += --disable-gles2
endif
ifeq ($(CONFIG_OPENGL_MESA_OPENGL),y)
	conf-args += --enable-opengl
else
	conf-args += --disable-opengl
endif

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure
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

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/dri/*.so \
	$(prefix)/lib/egl/*.so

include packages/cleanup.mk
include packages/binary.mk
