CUSTOM_TOOLCHAIN = y
VARIANT = alsa

# select toolchain
ifeq ($(CUSTOM_TOOLCHAIN),y)
  ARCH = arm
  CPU  = xscale
  OS   = linux
  LIBC = uclibc
  ABI  = eabi
  export ARCH CPU OS LIBC ABI

  TOOLCHAIN = $(ARCH)-$(CPU)-$(OS)-$(LIBC)$(ABI)-4.3
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

TARGET_LIBC = uclibc
export TARGET_LIBC

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = adx-medcom_defconfig
export LINUX_VERSION KERNEL_CONFIG

include platform/adx-medcom/packages.mk

PHONY += platform-clean
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-dirs  += $(ROOTFS)
platform-clean: __clean-files += $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean: __clean-files += $(PLATFORM)/u-boot.img $(PLATFORM)/zImage
platform-clean: __clean-files += $(PLATFORM)/u-boot.fit $(PLATFORM)/multi.its
platform-clean: __clean-files += $(PLATFORM)/System.map*
platform-clean: __clean-files += $(PLATFORM)/vmlinuz*
platform-clean: __clean-files += $(PLATFORM)/rootfs.img
platform-clean: __clean-files += $(PLATFORM)/kernel-version
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

custom := -f $(if $(PBUILD_SRC), $(srctree)/)platform/$(platform)/src/Makefile obj

PHONY += platform-install
platform-install:
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

