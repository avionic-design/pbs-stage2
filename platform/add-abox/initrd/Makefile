# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION  = git
KERNEL_CONFIG  = add-abox_defconfig
INITRD_VARIANT = uclibc
export LINUX_VERSION KERNEL_CONFIG INITRD_VARIANT

ifeq ($(LINUX_VERSION),git)
  packages-y = initrd/linux-image.git
else
  packages-y = initrd/linux-image
endif

ifeq ($(INITRD_VARIANT),uclibc)
  packages-y += \
	initrd/uclibc \
	initrd/busybox
else
  packages-y += \
	initrd/klibc
endif

packages-y += \
	initrd/udev \
	initrd/rootfs

PHONY += platform-install
platform-install:
#	cd $(PLATFORM)/initrd

PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)/tmp
platform-clean: __clean-dirs  += $(ROOTFS)
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean: __clean-files += $(PLATFORM)/u-boot.img $(PLATFORM)/zImage
platform-clean: __clean-files += $(PLATFORM)/System.map-*
platform-clean: __clean-files += $(PLATFORM)/vmlinuz-*
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs) ),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

