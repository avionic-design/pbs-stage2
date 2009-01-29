PACKAGE = openssl
VERSION = 0.9.8j

LOCATION = http://www.openssl.org/source
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

ARCH := $(patsubst i%86,x86,$(ARCH))

conf-args = \
	shared \
	--prefix=$(prefix) \
	--openssldir=$(prefix)/lib/ssl \
	no-idea no-mdc2 no-rc5 zlib-dynamic

ifeq ($(ARCH),arm)
  ifeq ($(CPU),xscale)
    config = linux-xscale
  else
  endif
endif

ifeq ($(ARCH),x86)
  config = linux-generic32
endif

ifndef config
  $(error no configuration defined)
endif

package-configure:
	cd $(pkgtree) && $(env) ./Configure $(conf-args) $(config)

build-vars = \
	CC='$(CC)' \
	LD='$(LD)' \
	EXTRA_CPPFLAGS='$(CPPFLAGS)' \
	EXTRA_CFLAGS='$(CFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-args = \
	MANDIR=$(prefix)/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(ROOTFS)

PHONY += package-do-install
package-do-install:
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

package-install: package-do-install package-strip
	$(priv) mv $(ROOTFS)/usr/lib/ssl/openssl.cnf $(ROOTFS)/etc/ssl

package-clean:
	@:

.PHONY: $(PHONY)

