PACKAGE = net-tools
VERSION = 1.60

LOCATION  = http://http.debian.net/debian/pool/main/n/$(PACKAGE)
TARBALLS  = $(PACKAGE)_$(VERSION).orig.tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz
DOTCONFIG = $(pkgsrctree)/$(PACKAGE)-$(VERSION)

include packages/common.mk

conf-args = \
	CC='$(CC)'

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(DOTCONFIG) $(pkgbuildtree)/config.status
	cd $(pkgbuildtree) && yes '' | \
		$(env) $(MAKE) $(conf-args) config
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	COPTS='$(CFLAGS)' \
	LOPTS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	BASEDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	/bin/hostname \
	/bin/netstat \
	/sbin/arp \
	/sbin/ifconfig \
	/sbin/nameif \
	/sbin/plipconfig \
	/sbin/rarp \
	/sbin/route \
	/sbin/slattach

include packages/cleanup.mk
include packages/binary.mk
