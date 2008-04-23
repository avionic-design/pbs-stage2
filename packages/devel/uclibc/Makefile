PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = small C library for embedded systems

##############################################################################

include packages/common.mk

DEF_CONFIG = conf/$(PACKAGE_FULLNAME).config
CPU_CONFIG = conf/$(PACKAGE_FULLNAME)-$(CPU).config
DOT_CONFIG = $(if $(wildcard $(CPU_CONFIG)),$(CPU_CONFIG),$(DEF_CONFIG))

conf-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS="$(ROOTFS)/usr/include" \
	MAKEFLAGS=

package-configure:
	cp $(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)/usr/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)/usr/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

rootfs-dirs = \
	$(ROOTFS)/etc/init.d \
	$(ROOTFS)/etc/rcS.d

package-install: $(rootfs-dirs)
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install_utils
	$(priv) cp `$(CROSS_COMPILE)gcc --print-file-name=libgcc_s.so.1` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libgcc_s.so.1
	$(priv) cp packages/$(package)/ldconfig.init $(ROOTFS)/etc/init.d/ldconfig
	$(priv) cp packages/$(package)/ld.so.conf $(ROOTFS)/etc/ld.so.conf
	$(priv) ln -s ../init.d/ldconfig $(ROOTFS)/etc/rcS.d/S50ldconfig

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

