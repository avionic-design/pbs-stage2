LIBC_VERSION ?= 0.9.30.1
PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = small C library for embedded systems

##############################################################################

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
ABI := $(shell echo $(CONFIG_ABI))

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(ABI).config
CPU_CONFIG = $(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

conf-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS="$(ROOTFS)$(prefix)/include" \
	MAKEFLAGS=

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.build
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/include \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/

rootfs-dirs = \
	$(ROOTFS)/etc/init.d \
	$(ROOTFS)/etc/rcS.d

$(pkgtree)/.do-install: $(rootfs-dirs)
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install_utils
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libgcc_s.so.1` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libgcc_s.so.1
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libstdc++.so.6` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libstdc++.so.6
	$(priv) cp $(pkgsrctree)/ldconfig.init $(ROOTFS)/etc/init.d/ldconfig
	$(priv) cp $(pkgsrctree)/ld.so.conf $(ROOTFS)/etc/ld.so.conf
	$(priv) ln -sf ../init.d/ldconfig $(ROOTFS)/etc/rcS.d/S50ldconfig
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/bin/ldd \
	/sbin/ldconfig

include packages/cleanup.mk

$(pkgtree)/.cleanup: package-cleanup
	$(call cmd,stamp)

$(pkgtree)/.package-install: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary $(pkgtree)/.package-install
	$(call cmd,stamp)

quiet_cmd_priv_mkdir_p = MKDIR   $@
      cmd_priv_mkdir_p = $(priv) mkdir -p $@

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

