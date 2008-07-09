PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.de.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk
prefix := $(prefix)/$(TARGET)

KERNELSRC     = $(pkgtree)
KERNEL_CONFIG = defconfig
export KERNELSRC KERNEL_CONFIG

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

