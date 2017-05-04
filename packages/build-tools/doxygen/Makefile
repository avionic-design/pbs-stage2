PACKAGE = doxygen
VERSION = 1.8.9.1
LICENSE = GPL

LOCATION = ftp://ftp.stack.nl/pub/users/dimitri/
TARBALLS = $(PACKAGE)-$(VERSION).src.tar.gz

include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix) \
	--shared \
	--make=$(MAKE)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
