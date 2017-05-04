PACKAGE = doxygen
VERSION = 1.8.13
LICENSE = GPL

LOCATION = ftp://ftp.stack.nl/pub/users/dimitri/
TARBALLS = $(PACKAGE)-$(VERSION).src.tar.gz

include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

cmake-args = \
	-DCMAKE_INSTALL_PREFIX=$(prefix)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) cmake . $(cmake-args)
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
