PACKAGE = linux-modules-2.6.git
VERSION = 000

KERNELSRC ?= ../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel modules

include packages/common.mk

RELEASE     = $(shell cat $(PLATFORM)/kernel-release)
INITRD_ROOT = $(abspath $(PLATFORM)/../initrd)
SYSTEM_MAP  = $(INITRD_ROOT)/System.map-$(RELEASE)

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config
	ln -sf $(SYSTEM_MAP) $(buildtree)/System.map

package-build:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) build-modules

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) install-modules

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

kernel-version:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) version

