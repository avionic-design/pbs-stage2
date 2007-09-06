PACKAGE = openssl
VERSION = 0.9.8e

LOCATION = http://www.openssl.org/source
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

conf-args = \
	shared \
	--prefix=$(prefix) \
	--openssldir=$(prefix)/lib/ssl \
	no-idea no-mdc2 no-rc5 zlib-dynamic \
	linux-xscale

package-configure:
	cd $(pkgtree) && $(env) ./Configure $(conf-args)

build-vars = \
	$(call set-args, CC LD LDFLAGS) \
	EXTRA_CFLAG='$(CFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-vars = \
	MANDIR=$(prefix)/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) $(install-vars) install

package-post-install:
	$(priv) mv $(ROOTFS)/usr/lib/ssl/openssl.cnf $(ROOTFS)/etc/ssl
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/libcrypto.so.*
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/libssl.so.*
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/engines/lib*.so

package-clean:
	@:

