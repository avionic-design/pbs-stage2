# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION  = git
KERNEL_CONFIG  = add-medinet_defconfig
INITRD_VARIANT = uclibc
export LINUX_VERSION KERNEL_CONFIG INITRD_VARIANT

