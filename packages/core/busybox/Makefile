PACKAGE = busybox
VERSION = 1.14.2

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
DESTDIR := $(pkgtree)/install

DEF_CONFIG = minimal
CPU_CONFIG = minimal-$(CPU)
DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(ARCH)

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(ARCH)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(DESTDIR) \
	ARCH=$(ARCH)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(DESTDIR)/bin/busybox
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.do-install
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(priv) mkdir -p $(ROOTFS)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
