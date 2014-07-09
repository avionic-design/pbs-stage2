include packages/autotools-base.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
			$(env) $(conf-cmd) $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-target ?= install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(priv) $(MAKE) $(install-args) $(install-target)
	$(call cmd,stamp)

.SECONDEXPANSION:
$(pkgtree)/.configure: $$(if $$(wildcard $$(local-src)),$(pkgtree)/.autoreconfigure)
