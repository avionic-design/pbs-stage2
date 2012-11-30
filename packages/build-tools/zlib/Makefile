include packages/libs/zlib/Makefile.location
include packages/build-tools/common.mk

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

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
