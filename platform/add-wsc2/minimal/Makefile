# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = add-wsc2_defconfig
export LINUX_VERSION KERNEL_CONFIG

NET      = y
USB      = n
SOUND    = n
SYSLOG   = n
NTP      = n
DHCP     = n
PPP      = n
SSH      = n
SERIAL   = n
FB       = n
PNG      = n
JPEG     = n
XORG     = n
QTOPIA   = n
DIRECTFB = n
GTK      = n
GTKMM    = n
DEBUG    = n

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

