# select toolchain
TOOLCHAIN = arm-xscale-linux-gnu
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif
export TOOLCHAIN

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = add-wsc2_defconfig
export LINUX_VERSION KERNEL_CONFIG

NET      = y
USB      = y
SOUND    = n
SYSLOG   = y
NTP      = y
DHCP     = y
PPP      = y
SSH      = y
SERIAL   = y
FB       = y
PNG      = y
JPEG     = y
XORG     = n
QTOPIA   = n
GTK      = n
GTKMM    = n
DEBUG    = y

include platform/packages.mk

PHONY += platform-clean
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-dirs  += $(ROOTFS)
platform-clean: __clean-files += $(PLATFORM)/System.map*
platform-clean: __clean-files += $(PLATFORM)/vmlinuz*
platform-clean: __clean-files += $(PLATFORM)/rootfs.img
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

