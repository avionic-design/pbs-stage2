CUSTOM_TOOLCHAIN = y

# select toolchain
ifeq ($(CUSTOM_TOOLCHAIN),y)
  ARCH = mips
  OS   = linux
  LIBC = uclibc
  export ARCH OS LIBC

  TOOLCHAIN = $(ARCH)-$(OS)-$(LIBC)
  ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
    include platform/toolchain/$(TOOLCHAIN)/Makefile
  endif
else
  ARCH = mips
  OS   = linux
  LIBC = uclibc
  CROSS_COMPILE = $(ARCH)-$(OS)-$(LIBC)-
  export ARCH OS LIBC CROSS_COMPILE
endif

TARGET_LIBC = uclibc
export TARGET_LIBC

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

#KERNELSRC = ../linux-2.6.28.y.git
KERNELSRC = ../linux-2.6.git
LINUX_VERSION = git
KERNEL_CONFIG = danube_defconfig
export KERNELSRC LINUX_VERSION KERNEL_CONFIG

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

PHONY += platform-install
platform-install:
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

