CUSTOM_TOOLCHAIN = y

# select toolchain
ifeq ($(CUSTOM_TOOLCHAIN),y)
  ARCH = x86_64
  OS   = linux
  LIBC = gnu
  export ARCH OS LIBC

  TOOLCHAIN = $(ARCH)-$(OS)-$(LIBC)
  ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
    include platform/toolchain/$(TOOLCHAIN)/Makefile
  endif
else
  ARCH = x86_64
  OS   = linux
  LIBC = gnu
  CROSS_COMPILE = $(ARCH)-$(OS)-$(LIBC)-
  export ARCH OS LIBC CROSS_COMPILE
endif

TARGET_LIBC = gnu
export TARGET_LIBC

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = x86_64_defconfig
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

include platform/common.mk

platform-clean-dirs	+= $(builddir)
platform-clean-dirs	+= $(ROOTFS)
platform-clean-file	+= $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean-files	+= $(PLATFORM)/u-boot.img $(PLATFORM)/zImage
platform-clean-files	+= $(PLATFORM)/u-boot.fit $(PLATFORM)/multi.its
platform-clean-files	+= $(PLATFORM)/System.map*
platform-clean-files	+= $(PLATFORM)/vmlinuz*
platform-clean-files	+= $(PLATFORM)/rootfs.img
platform-clean-files	+= $(PLATFORM)/kernel-version
platform-clean-files	+= $(PLATFORM)/kernel-release

include platform/cleanup.mk

PHONY += platform-clean
platform-clean: platform-cleanup
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-clean

PHONY += platform-install
platform-install:
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

