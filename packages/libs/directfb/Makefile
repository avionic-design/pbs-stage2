PACKAGE = DirectFB
VERSION = 1.1.1

LOCATION = http://www.directfb.org/downloads/Core
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

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

_package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

libs-strip = \
	/usr/lib/libdirect-1.1.so.0.1.0 \
	/usr/lib/libdirectfb-1.1.so.0.1.0 \
	/usr/lib/libfusion-1.1.so.0.1.0 \
	/usr/lib/directfb-1.1-0/systems/libdirectfb_devmem.so \
	/usr/lib/directfb-1.1-0/systems/libdirectfb_fbdev.so \
	/usr/lib/directfb-1.1-0/inputdrivers/libdirectfb_linux_input.so \
	/usr/lib/directfb-1.1-0/inputdrivers/libdirectfb_tslib.so \
	/usr/lib/directfb-1.1-0/wm/libdirectfbwm_default.so \
	/usr/lib/directfb-1.1-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_dfiff.so \
	/usr/lib/directfb-1.1-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_mpeg2.so \
	/usr/lib/directfb-1.1-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_png.so \
	/usr/lib/directfb-1.1-0/interfaces/IDirectFBFont/libidirectfbfont_default.so

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

