include packages/libs/openssl/Makefile.location
include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix) \
	shared zlib-dynamic

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./Configure $(conf-args) linux-x86_64
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args) $(build-vars)
	$(call cmd,stamp)

install-args = \
	INSTALL_PREFIX=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)
