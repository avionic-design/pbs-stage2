PACKAGE = psb-kernel-source
VERSION = 4.41.1

LOCATION = https://launchpad.net/~ubuntu-mobile/+archive/ppa/+files
TARBALLS = $(PACKAGE)_$(VERSION).orig.tar.gz

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

kerneltree = $(pkgtree)/../linux.git

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(MAKE) LINUXDIR=$(kerneltree)/build \
			O=$(pkgtree)/build \
			DRM_MODULES="psb"
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(MAKE) LINUXDIR=$(kerneltree)/build \
			O=$(pkgtree)/build \
			DRM_MODULES="psb" \
			INSTALL_MOD_PATH=$(DESTDIR) \
			install
	$(priv) mkdir -p $(DESTDIR)/lib/firmware && \
		$(priv) install -m 644 $(pkgsrctree)/msvdx_fw.bin \
			$(DESTDIR)/lib/firmware
	$(call cmd,stamp)

prunefiles = \
	/lib/modules/$(VERSION)/modules.alias \
	/lib/modules/$(VERSION)/modules.alias.bin \
	/lib/modules/$(VERSION)/modules.symbols \
	/lib/modules/$(VERSION)/modules.symbols.bin \
	/lib/modules/$(VERSION)/modules.dep \
	/lib/modules/$(VERSION)/modules.dep.bin

version = $(if $(wildcard $(kerneltree)/.release),$(shell cat $(kerneltree)/.release),)
$(pkgtree)/.binary:  VERSION = $(call version)
$(pkgtree)/.install: VERSION = $(call version)

include packages/cleanup.mk
include packages/binary.mk
