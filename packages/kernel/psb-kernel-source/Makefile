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
		$(MAKE) LINUXDIR=$(kerneltree)/build \
			O=$(pkgtree)/build \
			DRM_MODULES="psb" \
			INSTALL_MOD_PATH=$(DESTDIR) \
			install
	mkdir -p $(DESTDIR)/lib/firmware && \
		install -m 644 $(pkgsrctree)/msvdx_fw.bin \
			$(DESTDIR)/lib/firmware
	$(call cmd,stamp)

prunefiles = \
	/lib/modules/$(VERSION)/modules.alias \
	/lib/modules/$(VERSION)/modules.alias.bin \
	/lib/modules/$(VERSION)/modules.symbols \
	/lib/modules/$(VERSION)/modules.symbols.bin \
	/lib/modules/$(VERSION)/modules.dep \
	/lib/modules/$(VERSION)/modules.dep.bin

include packages/prune.mk

$(pkgtree)/.binary: VERSION = $(shell cat $(kerneltree)/.release)
$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.prune
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: VERSION = $(shell cat $(kerneltree)/.release)
$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
