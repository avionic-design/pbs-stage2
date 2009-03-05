LIBC_VERSION ?= 0.9.30.1
PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = small C library for embedded systems

##############################################################################

include packages/common.mk

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

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

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

package-do-install: $(rootfs-dirs)
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install_utils
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libgcc_s.so.1` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libgcc_s.so.1
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libstdc++.so.6` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libstdc++.so.6
	$(priv) cp packages/$(package)/ldconfig.init $(ROOTFS)/etc/init.d/ldconfig
	$(priv) cp packages/$(package)/ld.so.conf $(ROOTFS)/etc/ld.so.conf
	$(priv) ln -sf ../init.d/ldconfig $(ROOTFS)/etc/rcS.d/S50ldconfig

stripfiles = \
	$(prefix)/bin/ldd \
	/sbin/ldconfig

include packages/strip.mk

package-install: package-do-install package-strip
	@:

package-clean:
	@:

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

