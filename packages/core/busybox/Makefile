PACKAGE = busybox
VERSION = 1.13.2

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

DEF_CONFIG = $(PACKAGE_FULLNAME)-minimal
CPU_CONFIG = $(PACKAGE_FULLNAME)-minimal-$(CPU)
DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), \
		$(DEF_CONFIG)))

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(ROOTFS)/bin/busybox

package-clean:
	@:

