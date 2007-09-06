PACKAGE = ppp
VERSION = 2.4.4

LOCATION = ftp://us4.samba.org/pub/ppp
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

conf-args = \
	--prefix=$(prefix) \
	--sysconfdir=/etc

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-vars = \
	CC='$(CC)' \
	COPTS='$(CFLAGS) -trigraphs' \
	LDFLAGS='-shared $(LDFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-vars = \
	INSTROOT=$(ROOTFS) \
	DESTDIR=$(ROOTFS)/usr

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) $(install-vars) install

package-clean:
	@:

