PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/toolchain/common.mk

DEF_CONFIG = $(pkgsrctree)/conf/$(PACKAGE_FULLNAME).config
CPU_CONFIG = $(pkgsrctree)/conf/$(PACKAGE_FULLNAME)-$(CPU).config
DOT_CONFIG = $(if $(wildcard $(CPU_CONFIG)),$(CPU_CONFIG),$(DEF_CONFIG))

conf-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/$(TARGET)/include

package-configure:
	cp $(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	KERNEL_HEADERS=$(ROOTFS)$(prefix)/$(TARGET)/include \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=$(prefix)/$(TARGET)/ \
	DEVEL_PREFIX=$(prefix)/$(TARGET)/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	PREFIX=$(ROOTFS) \
	RUNTIME_PREFIX=$(prefix)/$(TARGET)/ \
	DEVEL_PREFIX=$(prefix)/$(TARGET)/

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

package-clean:
	@:

