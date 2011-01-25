PACKAGE = etherdump
VERSION = 2.10

LOCATION = http://sourceforge.net/projects/psydev/files/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd, stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd, stamp)

build-args = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	STRIP="$(STRIP)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd, stamp)

install-args = \
	INSTALL="$(INSTALL)" \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd, stamp)

include packages/cleanup.mk
include packages/binary.mk
