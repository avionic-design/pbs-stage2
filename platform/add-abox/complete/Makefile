# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = add-abox_defconfig
export LINUX_VERSION KERNEL_CONFIG

NET    = y
USB    = y
SOUND  = n
SYSLOG = y
NTP    = y
DHCP   = y
PPP    = y
SSH    = y
SERIAL = y
FB     = y
XORG   = n
QTOPIA = y
ABOX   = y
DEBUG  = y

include platform/packages.mk

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)

