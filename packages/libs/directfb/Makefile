PACKAGE = DirectFB
VERSION = 1.2.0-rc1

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

major = 1.2
plugin-dir = $(prefix)/lib/directfb-$(major)-0

_package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libdirectfb.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libdirect.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libfusion.la
	$(priv) find $(ROOTFS)$(plugin-dir) -name '*.la' -exec rm {} +

libs-strip = \
	$(prefix)/lib/libdirect-$(major).so.0.0.0 \
	$(prefix)/lib/libdirectfb-$(major).so.0.0.0 \
	$(prefix)/lib/libfusion-$(major).so.0.0.0 \
	$(plugin-dir)/systems/libdirectfb_devmem.so \
	$(plugin-dir)/systems/libdirectfb_fbdev.so \
	$(plugin-dir)/inputdrivers/libdirectfb_linux_input.so \
	$(plugin-dir)/inputdrivers/libdirectfb_tslib.so \
	$(plugin-dir)/wm/libdirectfbwm_default.so \
	$(plugin-dir)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_dfiff.so \
	$(plugin-dir)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_jpeg.so \
	$(plugin-dir)/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_png.so \
	$(plugin-dir)/interfaces/IDirectFBFont/libidirectfbfont_default.so

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

