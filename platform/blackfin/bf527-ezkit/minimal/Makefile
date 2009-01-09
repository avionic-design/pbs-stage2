CUSTOM_TOOLCHAIN = y

# select toolchain
ifeq ($(CUSTOM_TOOLCHAIN),y)
  ARCH = blackfin
  CPU  = bfin
  OS   = linux
  LIBC = uclibc
  export ARCH OS LIBC

  TOOLCHAIN = $(CPU)-$(OS)-$(LIBC)
  ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
    include platform/toolchain/$(TOOLCHAIN)/Makefile
  endif
else
  ARCH = blackfin
  CPU  = bfin
  OS   = linux
  LIBC = uclibc
  CROSS_COMPILE = $(CPU)-$(OS)-$(LIBC)-
  export ARCH OS LIBC CROSS_COMPILE
endif

TARGET_LIBC = uclibc
export TARGET_LIBC

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = BF527-EZKIT_defconfig
export LINUX_VERSION KERNEL_CONFIG

# select kernel version
ifeq ($(LINUX_VERSION),git)
  packages-y = kernel/linux.git
else
  packages-y = kernel/linux
endif

# select C library
ifeq ($(TARGET_LIBC),uclibc)
  packages-y += devel/uclibc
else
  packages-y += devel/glibc
endif

packages-y += core/busybox
packages-y += shells/bash

platform-clean-dirs	+= $(builddir)
platform-clean-dirs	+= $(ROOTFS)
platform-clean-files	+= $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean-files	+= $(PLATFORM)/u-boot.fit
platform-clean-files	+= $(PLATFORM)/System.map*
platform-clean-files	+= $(PLATFORM)/uImage*
platform-clean-files	+= $(PLATFORM)/vmlinux.gz
platform-clean-files	+= $(PLATFORM)/rootfs.img
platform-clean-files	+= $(PLATFORM)/kernel-version
platform-clean-files	+= $(PLATFORM)/kernel-release

include platform/cleanup.mk

PHONY += platform-clean
platform-clean: platform-cleanup
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

#custom := -f $(if $(PBUILD_SRC), $(srctree)/)platform/$(platform)/src/Makefile obj
#
#platform-install:
#	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

