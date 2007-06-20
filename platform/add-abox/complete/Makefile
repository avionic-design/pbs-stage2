# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
LINUX_VERSION = 2.6.21.5
export ROOTFS LINUX_VERSION

NET    = y
USB    = n
SOUND  = n
SYSLOG = y
NTP    = n
DHCP   = n
PPP    = n
SSH    = y
SERIAL = n
FB     = n
ABOX   = y
DEBUG  = n

include platform/packages.mk

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)

