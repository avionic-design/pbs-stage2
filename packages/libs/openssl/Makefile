PACKAGE = openssl
VERSION = 0.9.8j

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

install-args = \
	MANDIR=$(prefix)/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(ROOTFS)

PHONY += _install
_install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install

plugin = $(prefix)/lib/engines
sover  = 0.9.8

stripfiles = \
	$(prefix)/bin/openssl \
	$(prefix)/lib/libcrypto.so.$(sover) \
	$(prefix)/lib/libssl.so.$(sover) \
	$(plugin)/lib4758cca.so \
	$(plugin)/libaep.so \
	$(plugin)/libatalla.so \
	$(plugin)/libcapi.so \
	$(plugin)/libchil.so \
	$(plugin)/libcswift.so \
	$(plugin)/libgmp.so \
	$(plugin)/libnuron.so \
	$(plugin)/libsureware.so \
	$(plugin)/libubsec.so

include packages/cleanup.mk

package-install: _install _strip
	$(priv) mv $(ROOTFS)/usr/lib/ssl/openssl.cnf $(ROOTFS)/etc/ssl

package-clean:
	@:

.PHONY: $(PHONY)

