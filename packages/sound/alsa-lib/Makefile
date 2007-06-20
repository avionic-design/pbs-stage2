PACKAGE = alsa-lib
VERSION = 1.0.14

LOCATION = ftp://ftp.alsa-project.org/pub/lib
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

LDFLAGS += --sysroot $(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--with-sysroot=$(ROOTFS) \
	$(call set-args, CC CXX CFLAGS LD LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
	# FIXME: is this necessary?
	#cd $(pkgtree) && ./libtool --finish $(ROOTFS)/usr/lib

