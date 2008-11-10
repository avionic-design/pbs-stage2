PACKAGE = xorg-server
VERSION = 1.5.3

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
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
	--sysconfdir=/etc \
	--disable-kdrive \
	--disable-xfbdev \
	--disable-xinerama \
	--disable-xprint \
	--disable-dpms \
	--disable-xv \
	--disable-xgl \
	--disable-glx \
	--disable-dri \
	--disable-dri2 \
	--disable-dga \
	--enable-xv \
	--enable-xorg

conf-vars = \
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

module = $(prefix)/lib/xorg/modules

prunefiles = \
	$(module)/libafb.la \
	$(module)/libcfb.la \
	$(module)/libcfb32.la \
	$(module)/libexa.la \
	$(module)/libfb.la \
	$(module)/libint10.la \
	$(module)/libmfb.la \
	$(module)/libshadow.la \
	$(module)/libshadowfb.la \
	$(module)/libvbe.la \
	$(module)/libvgahw.la \
	$(module)/libwfb.la \
	$(module)/libxaa.la \
	$(module)/libxf1bpp.la \
	$(module)/libxf4bpp.la \
	$(module)/libxf8_16bpp.la \
	$(module)/libxf8_32bpp.la \
	$(module)/extensions/libdbe.la \
	$(module)/extensions/libextmod.la \
	$(module)/fonts/libfreetype.la \
	$(module)/linux/libfbdevhw.la \
	$(module)/multimedia/bt829_drv.la \
	$(module)/multimedia/fi1236_drv.la \
	$(module)/multimedia/msp3430_drv.la \
	$(module)/multimedia/tda8425_drv.la \
	$(module)/multimedia/tda9850_drv.la \
	$(module)/multimedia/tda9885_drv.la \
	$(module)/multimedia/uda1380_drv.la

stripfiles = \
	$(prefix)/bin/cvt \
	$(prefix)/bin/gtf \
	$(prefix)/bin/ioport \
	$(prefix)/bin/Xnest \
	$(prefix)/bin/Xorg \
	$(prefix)/bin/Xvfb \
	$(prefix)/bin/xorgconfig \
	$(module)/libafb.so \
	$(module)/libcfb.so \
	$(module)/libcfb32.so \
	$(module)/libexa.so \
	$(module)/libfb.so \
	$(module)/libint10.so \
	$(module)/libmfb.so \
	$(module)/libshadow.so \
	$(module)/libshadowfb.so \
	$(module)/libvbe.so \
	$(module)/libvgahw.so \
	$(module)/libwfb.so \
	$(module)/libxaa.so \
	$(module)/libxf1bpp.so \
	$(module)/libxf4bpp.so \
	$(module)/libxf8_16bpp.so \
	$(module)/libxf8_32bpp.so \
	$(module)/extensions/libdbe.so \
	$(module)/extensions/libextmod.so \
	$(module)/fonts/libfreetype.so \
	$(module)/linux/libfbdevhw.so \
	$(module)/multimedia/bt829_drv.so \
	$(module)/multimedia/fi1236_drv.so \
	$(module)/multimedia/msp3430_drv.so \
	$(module)/multimedia/tda8425_drv.so \
	$(module)/multimedia/tda9850_drv.so \
	$(module)/multimedia/tda9885_drv.so \
	$(module)/multimedia/uda1380_drv.so

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

