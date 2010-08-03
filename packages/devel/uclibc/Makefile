PACKAGE = uClibc
VERSION = 0.9.31

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
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
	KERNEL_HEADERS="$(SYSROOT)$(prefix)/include"

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(SYSROOT)$(prefix)/include \
	PREFIX=$(DESTDIR) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	CROSS=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(SYSROOT)$(prefix)/include \
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

stripfiles = \
	$(prefix)/bin/ldd \
	/sbin/ldconfig

include packages/cleanup.mk
include packages/binary.mk
