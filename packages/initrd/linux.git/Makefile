PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= ../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config

package-build:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) build

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) headers-install
	$(Q)$(MAKE) $(kernel)=platform/$(platform) install

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

