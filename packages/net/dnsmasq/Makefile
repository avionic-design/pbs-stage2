PACKAGE = dnsmasq
VERSION = 2.47

LOCATION = http://www.thekelleys.org.uk/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.lzma

DESCRIPTION = a small caching DNS proxy and DHCP/TFTP server

##############################################################################

include packages/common.mk
CPPFLAGS := --sysroot $(ROOTFS)
CFLAGS := $(CPPFLAGS)
LDFLAGS := --sysroot $(ROOTFS)

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	COPTS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	PREFIX=$(prefix)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(ROOTFS) \
	PREFIX=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/dnsmasq

include packages/cleanup.mk

$(pkgtree)/.package-install: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.package-install
	$(call cmd,stamp)
