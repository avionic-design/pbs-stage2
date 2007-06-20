PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://www.uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

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
	PREFIX= \
	RUNTIME_PREFIX= \
	DEVEL_PREFIX=

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL_HEADERS=$(ROOTFS)/usr/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install_utils
	cp `$(CROSS_COMPILE)gcc --print-file-name=libgcc_s.so.1` $(ROOTFS)/lib
	cp packages/$(package)/ldconfig.init $(ROOTFS)/etc/init.d/ldconfig
	ln -s ../init.d/ldconfig $(ROOTFS)/etc/rcS.d/S50ldconfig

