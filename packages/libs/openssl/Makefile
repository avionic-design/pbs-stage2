PACKAGE = openssl
VERSION = 0.9.8e

LOCATION = http://www.openssl.org/source
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

PATCHFILES = \
	$(DISTNAME)-xscale-config.patch \
	$(DISTNAME)-no-rpath.patch

include packages/common.mk

env = env -i $(call set-args, PATH CC CFLAGS LDFLAGS)

conf-args = \
	shared \
	--prefix=/usr \
	--openssldir=/usr/lib/ssl \
	no-idea no-mdc2 no-rc5 zlib-dynamic \
	linux-xscale

package-configure:
	cd $(pkgtree) && $(env) ./Configure $(conf-args)

build-args = \
	$(call set-args, CC) \
	EXTRA_CFLAG='$(CFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	MANDIR=/usr/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) mv $(ROOTFS)/usr/lib/ssl/openssl.cnf $(ROOTFS)/etc/ssl

