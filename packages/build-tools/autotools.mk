include packages/build-tools/common.mk

BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

env += \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
