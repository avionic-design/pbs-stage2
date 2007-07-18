PACKAGE = atk
VERSION = 1.19.3

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/atk/1.19
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

env += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
	sysroot=$(ROOTFS)

CC  += --sysroot $(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LD LDFLAGS)

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

