PACKAGE = busybox
VERSION = 1.13.1

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

DOT_CONFIG = $(PACKAGE_FULLNAME)-minimal

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(ROOTFS) \
	ARCH=$(ARCH)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(ROOTFS)/bin/busybox

package-clean:
	@:

