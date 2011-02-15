include packages/autotools-base.mk

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
			$(env) $(conf-cmd) $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)
