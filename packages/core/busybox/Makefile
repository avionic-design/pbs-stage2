PACKAGE = busybox
VERSION = 1.13.3

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))

DEF_CONFIG = minimal
CPU_CONFIG = minimal-$(CPU)
DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
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
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.build
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(ROOTFS)/bin/busybox
	$(call cmd,stamp)

