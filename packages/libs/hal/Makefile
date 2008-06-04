PACKAGE = hal
VERSION = 0.5.11

LOCATION = http://hal.freedesktop.org/releases
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

conf-args = \
	--prefix=$(prefix) \
	--host=$(TARGET) \
	--disable-policy-kit \
	--disable-pci-ids \
	--disable-usb-ids

conf-vars = \
	CFLAGS='$(CFLAGS)' \
	VOLUME_ID_CFLAGS='-I/usr/include' \
	VOLUME_ID_LIBS='-lvolume_id' \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

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

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

