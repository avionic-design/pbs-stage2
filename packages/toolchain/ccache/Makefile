PACKAGE = ccache
VERSION = 3.1.7

LOCATION = http://www.samba.org/ftp/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build/obj-$(BUILD) && \
		cd $(pkgtree)/build/obj-$(BUILD) && \
			$(env) $(pkgbuildtree)/configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/build/obj-$(BUILD) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgtree)/build/obj-$(BUILD) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
