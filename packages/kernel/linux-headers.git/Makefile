PACKAGE = linux-headers-2.6.git
VERSION = 000

KERNELSRC ?= ../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel headers

include packages/common.mk

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config

package-build:
	@:

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) headers-install

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

kernel-version:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) version

