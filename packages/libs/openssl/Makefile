PACKAGE = openssl
VERSION = 0.9.8k

LOCATION = http://www.openssl.org/source
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

##############################################################################

include packages/common.mk

ARCH := $(patsubst i%86,x86,$(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	shared \
	--prefix=$(prefix) \
	--enginesdir=$(prefix)/lib/ssl/engines \
	--openssldir=/etc/ssl \
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

$(pkgtree)/.configure:
	cd $(pkgbuildtree) && \
		$(env) ./Configure $(conf-args) $(config)
	$(call cmd,stamp)

build-vars = \
	CC='$(CC)' \
	LD='$(LD)' \
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

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
