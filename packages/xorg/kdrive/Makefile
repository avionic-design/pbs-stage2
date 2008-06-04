PACKAGE = xorg-server
VERSION = 1.4.99.902

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

conf-args = \
	--prefix=$(prefix) \
	--host=$(TARGET) \
	--enable-xfbdev \
	--disable-xinerama \
	--disable-xprint \
	--disable-dpms \
	--disable-xv \
	--disable-xorg \
	--disable-xgl \
	--disable-glx \
	--disable-dri \
	--disable-dri2

conf-vars = \
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =
package-build:
	cd $(pkgtree)/obj-$(TARGET) && $(env) $(MAKE) $(build-args)

package-install:
	@:

package-clean:
	@:

