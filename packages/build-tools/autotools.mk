include packages/build-tools/common.mk

BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-target ?= install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(BUILD_GNU_TYPE) && \
		$(env) $(MAKE) $(install-args) $(install-target)
	$(call cmd,stamp)

include packages/build-tools/cleanup.mk
