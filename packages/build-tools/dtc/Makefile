PACKAGE = dtc
VERSION = v1.3.0

LOCATION = http://jdl.com/software
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	PREFIX=$(prefix) \
	INSTALL=install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
