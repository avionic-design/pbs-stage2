PACKAGE = squashfs
VERSION = 4.3
LICENSE = GPL

LOCATION = http://downloads.sourceforge.net/project/$(PACKAGE)/$(PACKAGE)/$(PACKAGE)$(VERSION)
TARBALLS = $(PACKAGE)$(VERSION).tar.gz

include packages/build-tools/common.mk

pkgbuildtree:=$(pkgtree)/$(PACKAGE)$(VERSION)/squashfs-tools

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args += \
	LZO_SUPPORT=1

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args) -j $(NUM_CPU)
	$(call cmd,stamp)

install-args = \
	INSTALL_DIR=$(prefix)/bin \
	INSTALL=install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
