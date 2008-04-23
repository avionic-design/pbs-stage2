PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk
prefix := $(prefix)/$(HOST)
export prefix priv

KERNELSRC     = $(pkgtree)
KERNEL_CONFIG = defconfig
ROOTFS        =
export KERNELSRC KERNEL_CONFIG ROOTFS

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config

package-build:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) headers-check

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) headers-install

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

kernel-version:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) version

