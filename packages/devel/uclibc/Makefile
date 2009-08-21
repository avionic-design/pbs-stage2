LIBC_VERSION ?= 0.9.30.1
PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = small C library for embedded systems

##############################################################################

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
LIBC := $(shell echo $(CONFIG_LIBC))
ABI := $(shell echo $(CONFIG_ABI))
DESTDIR := $(pkgtree)/install

ARCH := $(subst bfin,blackfin,$(ARCH))

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(ABI).config
CPU_CONFIG = $(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

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
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/include \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(DESTDIR) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/

dest-dirs = \
	$(DESTDIR)/etc/init.d \
	$(DESTDIR)/etc/rcS.d

quiet_cmd_priv_mkdir_p = MKDIR   $@
      cmd_priv_mkdir_p = $(priv) mkdir -p $@

$(dest-dirs):
	$(call cmd,priv_mkdir_p)

$(pkgtree)/.do-install: $(pkgtree)/.build $(dest-dirs)
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install_utils
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libgcc_s.so.1` $(DESTDIR)/lib
	$(priv) $(STRIP) $(DESTDIR)/lib/libgcc_s.so.1
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libstdc++.so.6` $(DESTDIR)/lib
	$(priv) $(STRIP) $(DESTDIR)/lib/libstdc++.so.6
	$(priv) cp $(pkgsrctree)/ldconfig.init $(DESTDIR)/etc/init.d/ldconfig
	$(priv) cp $(pkgsrctree)/ld.so.conf $(DESTDIR)/etc/ld.so.conf
	$(priv) ln -sf ../init.d/ldconfig $(DESTDIR)/etc/rcS.d/S50ldconfig
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/bin/ldd \
	/sbin/ldconfig

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(priv) mkdir -p $(ROOTFS)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
