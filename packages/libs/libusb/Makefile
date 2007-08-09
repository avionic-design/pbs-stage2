PACKAGE = libusb
VERSION = 0.1.12

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CXX CFLAGS LDFLAGS)

package-configure:
	cp support/config.{guess,sub} $(pkgtree)
#	cp support/libtool $(pkgtree)/libtool
#	cp support/libtool $(pkgtree)/ltmain.sh
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

