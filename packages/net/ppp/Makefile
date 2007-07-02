PACKAGE = ppp
VERSION = 2.4.4

LOCATION = ftp://us4.samba.org/pub/ppp
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--prefix=/usr

package-configure:

build-args = \
	CC='$(CC)' \
	COPTS='$(CFLAGS) -trigraphs' \
	LDFLAGS='-shared $(LDFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	INSTROOT=$(ROOTFS) \
	DESTDIR=$(ROOTFS)/usr

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

