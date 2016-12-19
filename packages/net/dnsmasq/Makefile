PACKAGE = dnsmasq
VERSION = 2.76

LOCATION = http://www.thekelleys.org.uk/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

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

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix)

# This package builds on the 'install' target. And also installs. Odd.
$(pkgtree)/.do-install: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(priv) $(MAKE) $(build-args) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/dnsmasq

include packages/cleanup.mk
include packages/binary.mk
