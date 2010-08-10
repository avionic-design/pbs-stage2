include packages/build-tools/common.mk

env += \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(BUILD) && \
		cd $(pkgbuildtree)/obj-$(BUILD) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(env) $(MAKE)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(env) $(MAKE) install
	$(call cmd,stamp)

