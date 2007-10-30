PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= ../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel image

##############################################################################

package-configure:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) config

package-build:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) build-zImage

package-install:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) headers-install
	$(Q)$(MAKE) $(kernel)=platform/$(platform) install-zImage

package-clean:
	$(Q)$(MAKE) $(kernel)=platform/$(platform) clean

