PACKAGE = net-tools
VERSION = 1.60

LOCATION  = http://www.tazenda.demon.co.uk/phil/$(PACKAGE)
TARBALLS  = $(PACKAGE)-$(VERSION).tar.bz2
DOTCONFIG = $(pkgsrctree)/$(PACKAGE)-$(VERSION)

include packages/common.mk

conf-args = \
	CC='$(CC)'

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	cp $(DOTCONFIG) $(pkgtree)/config.status
	cd $(pkgbuildtree) && yes '' | \
		$(env) $(MAKE) $(conf-args) config
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	COPTS='$(CFLAGS)' \
	LOPTS='$(LDFLAGS)'

$(pkgtree)/.build:
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
