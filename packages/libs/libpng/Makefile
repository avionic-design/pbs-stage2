PACKAGE = libpng
VERSION = 1.2.18

LOCATION = ftp://ftp.simplesystems.org/pub/libpng/png/src
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

env += sysroot=$(ROOTFS)
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

