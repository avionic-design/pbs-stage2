# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

LINUX_VERSION = 2.6.21.5
INITRD_VARIANT = uclibc
export INITRD_VARIANT

ifeq ($(INITRD_VARIANT),uclibc)
packages-y = \
	initrd/linux-headers \
	initrd/uclibc \
	initrd/busybox \
	initrd/udev \
	initrd/rootfs
else
packages-y += initrd/linux
packages-y += initrd/klibc
packages-y += initrd/udev
packages-y += initrd/rootfs
endif

PHONY += platform-install
platform-install:
#	cd $(PLATFORM)/initrd

PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)/tmp
platform-clean: __clean-dirs  += $(ROOTFS)
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/initrd.img $(PLATFORM)/initrd.gz
platform-clean:
	$(if $(wildcard $(__clean-dirs) ),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

