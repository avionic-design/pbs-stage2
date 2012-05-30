PACKAGE = zlib
VERSION = 1.2.7
LICENSE = ZLIB

LOCATION = http://prdownloads.sourceforge.net/libpng/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

env += \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)'

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
