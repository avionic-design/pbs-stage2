PACKAGE = openssl
VERSION = 1.0.0

LOCATION = http://www.openssl.org/source
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

ARCH := $(patsubst i%86,x86,$(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
LIBC := $(shell echo $(CONFIG_LIBC))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--cross-compile-prefix=$(TARGET)- \
	--prefix=$(prefix) \
	--openssldir=/etc/ssl \
	shared zlib-dynamic

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

$(pkgtree)/.configure:
	cd $(pkgbuildtree) && \
		$(env) ./Configure $(conf-args) $(config)
	$(call cmd,stamp)

build-vars = \
	EXTRA_CPPFLAGS='$(CPPFLAGS)' \
	EXTRA_CFLAGS='$(CFLAGS)'

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args) $(build-vars)
	$(call cmd,stamp)

install-args = \
	MANDIR=$(prefix)/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/ssl/engines
sover  = 1.0.0

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
	$(plugin)/libgost.so \
	$(plugin)/libnuron.so \
	$(plugin)/libpadlock.so \
	$(plugin)/libsureware.so \
	$(plugin)/libubsec.so

include packages/cleanup.mk
include packages/binary.mk
