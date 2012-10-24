PACKAGE = nspr
VERSION = 4.9.2
LICENSE = MPL

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/$(PACKAGE)/releases/v$(VERSION)/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

env += \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	HOST_CFLAGS="-O2 -g" \
	HOST_LDFLAGS=" "

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc \
	--enable-optimize \
	--disable-debug

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
			$(env) $(pkgbuildtree)/mozilla/nsprpub/configure $(conf-args)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so

include packages/cleanup.mk
include packages/binary.mk
