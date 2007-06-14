# select toolchain
TOOLCHAIN = arm-xscale-linux-uclibc
ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

ROOTFS = $(PLATFORM)/rootfs
export ROOTFS

VARIANT = uclibc

ifeq ($(VARIANT),uclibc)
packages-y = \
	initrd/linux-headers \
	initrd/uclibc \
	initrd/busybox \
	initrd/udev \
	initrd/rootfs
else
packages-y = \
	initrd/linux \
	initrd/klibc \
	initrd/udev \
	initrd/rootfs
endif

PHONY += platform-install
platform-install:
#	cd $(PLATFORM)/initrd

PHONY += platform-clean
platform-clean: __clean-dirs += $(ROOTFS)
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)

