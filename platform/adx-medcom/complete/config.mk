# select toolchain
TOOLCHAIN = arm-xscale-linux-gnu
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif
export TOOLCHAIN

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = adx-medcom_defconfig
export LINUX_VERSION KERNEL_CONFIG

