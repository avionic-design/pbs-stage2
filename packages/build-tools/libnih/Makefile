include packages/libs/libnih/Makefile.location
include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir $(pkgbuildtree)/obj-$(BUILD) && \
		cd $(pkgbuildtree)/obj-$(BUILD) && \
			../configure --prefix=$(prefix)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(MAKE)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(MAKE) install
	$(call cmd,stamp)
