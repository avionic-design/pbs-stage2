PACKAGE = dnsmasq
VERSION = 2.56

LOCATION = http://www.thekelleys.org.uk/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.lzma

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	COPTS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	PREFIX=$(prefix)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/dnsmasq

include packages/cleanup.mk
include packages/binary.mk
