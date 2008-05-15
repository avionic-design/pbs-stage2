PACKAGE = busybox
VERSION = 1.10.0

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

DOT_CONFIG = $(PACKAGE_FULLNAME)-minimal

conf-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(ARCH) \
	CONFIG_PREFIX=$(ROOTFS)

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(ARCH) \
	CONFIG_PREFIX=$(ROOTFS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(ARCH) \
	CONFIG_PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(ROOTFS)/bin/busybox

ifneq ($(TARGET_LIBC),$(LIBC))
  ifeq ($(TARGET_LIBC),uclibc)
    conf-args    += CFLAGS='-muclibc'
    build-args   += CFLAGS='-muclibc'
    install-args += CFLAGS='-muclibc'
  endif
endif

