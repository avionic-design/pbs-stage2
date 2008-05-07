# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

prefix = /usr
priv = sudo
ROOTFS = $(PLATFORM)/rootfs
export prefix priv ROOTFS

LINUX_VERSION = git
KERNEL_CONFIG = adx-abox_defconfig
export LINUX_VERSION KERNEL_CONFIG

ifeq ($(LINUX_VERSION),git)
  packages-y = kernel/linux.git
else
  packages-y = kernel/linux
endif

packages-y += \
	devel/uclibc \
	core/busybox

PHONY += platform-clean
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-dirs  += $(ROOTFS)
platform-clean: __clean-files += $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean: __clean-files += $(PLATFORM)/u-boot.img $(PLATFORM)/zImage
platform-clean: __clean-files += $(PLATFORM)/System.map*
platform-clean: __clean-files += $(PLATFORM)/vmlinuz*
platform-clean: __clean-files += $(PLATFORM)/rootfs.img
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

custom := -f $(if $(PBUILD_SRC), $(srctree)/)platform/$(platform)/src/Makefile obj

platform-install:
	$(Q)$(MAKE) $(custom)=platform/$(platform) rootfs-install

.PHONY: $(PHONY)

