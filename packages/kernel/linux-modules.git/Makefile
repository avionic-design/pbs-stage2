PACKAGE = linux-modules-2.6.git
VERSION = 000

KERNELSRC ?= ../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel modules

include packages/common.mk

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config

package-build:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) build-modules

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) install-modules

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

kernel-version:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) version

