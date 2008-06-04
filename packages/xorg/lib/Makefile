LOCATION ?= http://xorg.freedesktop.org/releases/individual/lib
TARBALLS ?= $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

env += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

conf-args = \
	--host=$(TARGET) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(extra-conf-args)

conf-vars = \
	CFLAGS='$(CFLAGS)'

package-configure: package-pre-configure
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	$(extra-build-args)

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	$(extra-install-args)

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

# dummy targets
package-pre-configure:

