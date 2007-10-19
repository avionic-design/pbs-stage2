ROOTFS = $(abspath $(PLATFORM)/../rootfs)
export ROOTFS

ifdef config
  ifneq ($(wildcard $(PLATFORM)/configs/$(config)),)
    include $(PLATFORM)/configs/$(config)
  else
    include $(PLATFORM)/configs/generic
  endif
endif

LINUX_VERSION = 2.6.23.1
GCC_VERSION   = 4.2.2
LIBC          = glibc
export LINUX_VERSION GCC_VERSION LIBC

# build a target toolchain
packages-y += buildroot/toolchain/linux-headers
packages-y += buildroot/toolchain/binutils
packages-y += buildroot/toolchain/$(LIBC)-headers
packages-y += buildroot/toolchain/gcc-core
packages-y += buildroot/toolchain/$(LIBC)
packages-y += buildroot/toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

