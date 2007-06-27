LOCATION ?= http://xorg.freedesktop.org/releases/individual/lib
TARBALLS ?= $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

env += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, AR CC CFLAGS LD LDFLAGS RANLIB STRIP) \
	$(extra-conf-args)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args = \
	$(extra-build-args)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	$(extra-install-args)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

