PACKAGE = DirectFB
VERSION = 1.3.0

LOCATION = http://www.directfb.org/downloads/Core
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc

conf-args += \
	--disable-osx \
	--disable-x11 \
	--disable-voodoo \
	--disable-sdl \
	--disable-vnc \
	--enable-sysfs \
	--disable-gif \
	--enable-jpeg \
	--enable-png \
	--disable-freetype \
	--disable-video4linux \
	--disable-video4linux2 \
	--with-inputdrivers=linuxinput,tslib \
	--with-gfxdrivers=none

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
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

major  = 1.3
plugin = $(prefix)/lib/directfb-$(major)-0

prunefiles = \
	$(prefix)/lib/libdirect.la \
	$(prefix)/lib/libdirectfb.la \
	$(prefix)/lib/libfusion.la \
	$(plugin)/inputdrivers/libdirectfb_linux_input.la \
	$(plugin)/inputdrivers/libdirectfb_tslib.la \
	$(plugin)/interfaces/IDirectFBFont/libidirectfbfont_default.la \
	$(plugin)/interfaces/IDirectFBFont/libidirectfbfont_dgiff.la \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_dfiff.la \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_jpeg.la \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_png.la \
	$(plugin)/systems/libdirectfb_devmem.la \
	$(plugin)/systems/libdirectfb_fbdev.la \
	$(plugin)/wm/libdirectfbwm_default.la

stripfiles = \
	$(prefix)/bin/dfbdump \
	$(prefix)/bin/dfbfx \
	$(prefix)/bin/dfbg \
	$(prefix)/bin/dfbinfo \
	$(prefix)/bin/dfbinput \
	$(prefix)/bin/dfbinspector \
	$(prefix)/bin/dfblayer \
	$(prefix)/bin/dfbmaster \
	$(prefix)/bin/dfbpenmount \
	$(prefix)/bin/dfbscreen \
	$(prefix)/bin/directfb-csource \
	$(prefix)/bin/mkdfiff \
	$(prefix)/lib/libdirect-$(major).so.0.0.0 \
	$(prefix)/lib/libdirectfb-$(major).so.0.0.0 \
	$(prefix)/lib/libfusion-$(major).so.0.0.0 \
	$(plugin)/inputdrivers/libdirectfb_linux_input.so \
	$(plugin)/inputdrivers/libdirectfb_tslib.so \
	$(plugin)/interfaces/IDirectFBFont/libidirectfbfont_default.so \
	$(plugin)/interfaces/IDirectFBFont/libidirectfbfont_dgiff.so \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_dfiff.so \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_jpeg.so \
	$(plugin)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_png.so \
	$(plugin)/systems/libdirectfb_devmem.so \
	$(plugin)/systems/libdirectfb_fbdev.so \
	$(plugin)/wm/libdirectfbwm_default.so

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

