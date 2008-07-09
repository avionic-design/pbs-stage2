include platform/$(platform)/config.mk

# create package list
ifeq ($(LINUX_VERSION),git)
  packages-y = kernel/linux.git
else
  packages-y = kernel/linux
endif

ifeq ($(INITRD_VARIANT),uclibc)
  packages-y += \
	devel/uclibc \
	core/busybox
else
  packages-y += \
	devel/klibc
endif

packages-y += \
	core/udev \
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
platform-clean: __clean-files += $(PLATFORM)/u-boot.fit $(PLATFORM)/multi.its
platform-clean: __clean-files += $(PLATFORM)/System.map-*
platform-clean: __clean-files += $(PLATFORM)/vmlinuz-*
platform-clean: __clean-files += $(PLATFORM)/kernel-version
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs) ),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

