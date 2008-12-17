CUSTOM_TOOLCHAIN = y

# select toolchain
ifeq ($(CUSTOM_TOOLCHAIN),y)
  ARCH = arm
  CPU  = xscale
  OS   = linux
  LIBC = uclibc
  ABI  = eabi
  export ARCH CPU OS LIBC ABI

  TOOLCHAIN = $(ARCH)-$(CPU)-$(OS)-$(LIBC)$(ABI)
  ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
    include platform/toolchain/$(TOOLCHAIN)/Makefile
  endif
else
  ARCH = arm
  CPU  = xscale
  OS   = linux
  LIBC = gnu
  ABI  = eabi
  CROSS_COMPILE = $(ARCH)-$(OS)-$(LIBC)$(ABI)-
  export ARCH OS LIBC ABI CROSS_COMPILE
endif

TARGET_LIBC    = uclibc
TARGET_BUSYBOX = shared
export TARGET_LIBC TARGET_BUSYBOX

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = adx-rmu_defconfig
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

# select busybox variant
ifeq ($(TARGET_BUSYBOX),static)
  packages-y += core/busybox-static
else
  packages-y += core/busybox
endif

packages-y += devel/gdb-server
packages-y += devel/strace
packages-y += libs/libusb
packages-y += core/usbutils
packages-y += libs/libpcap
packages-y += net/tcpdump
packages-y += net/switchctrl

include platform/common.mk

platform-clean-dirs	+= $(builddir)
platform-clean-dirs	+= $(ROOTFS)
platform-clean-files	+= $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean-files	+= $(PLATFORM)/u-boot.img $(PLATFORM)/zImage
platform-clean-files	+= $(PLATFORM)/u-boot.fit $(PLATFORM)/multi.its
platform-clean-files	+= $(PLATFORM)/System.map*
platform-clean-files	+= $(PLATFORM)/vmlinuz*
platform-clean-files	+= $(PLATFORM)/rootfs.img
platform-clean-files	+= $(PLATFORM)/kernel-release
platform-clean-files	+= $(PLATFORM)/kernel-version

include platform/cleanup.mk

PHONY += platform-clean
platform-clean: platform-cleanup
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-clean

PHONY += platform-install
platform-install:
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

