PACKAGE = libiconv
VERSION = 1.11

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

env += sysroot=$(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LD LDFLAGS)

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/build-aux/ltmain.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/libcharset/build-aux/ltmain.sh
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
	libtool --finish $(ROOTFS)/usr/lib

