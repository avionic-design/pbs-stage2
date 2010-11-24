PACKAGE = ppp
VERSION = 2.4.5

LOCATION = ftp://ftp.samba.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix) \
	--sysconfdir=/etc

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args)
	$(call cmd,stamp)

build-args = \
	CC=$(CC) \
	EXTRA_CFLAGS="$(CFLAGS)" \
	EXTRA_LDFLAGS="$(LDFLAGS)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	INSTROOT=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/pppd/$(VERSION)

stripfiles = \
	$(plugin)/minconn.so \
	$(plugin)/passprompt.so \
	$(plugin)/passwordfd.so \
	$(plugin)/pppoatm.so \
	$(plugin)/radattr.so \
	$(plugin)/radius.so \
	$(plugin)/radrealms.so \
	$(plugin)/rp-pppoe.so \
	$(plugin)/winbind.so \
	$(prefix)/sbin/chat \
	$(prefix)/sbin/pppd \
	$(prefix)/sbin/pppdump \
	$(prefix)/sbin/pppoe-discovery \
	$(prefix)/sbin/pppstats

include packages/cleanup.mk
include packages/binary.mk
