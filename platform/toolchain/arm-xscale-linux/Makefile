ARCH = arm
ARCH_LONG = armv5te
CPU = xscale
TUNE = xscale
OS = linux
LIBC = glibc
HOST = $(ARCH)-$(CPU)-$(OS)
export ARCH ARCH_LONG CPU TUNE OS LIBC HOST

GCC_VERSION = 4.2.0
export GCC_VERSION

ifndef TOOLCHAIN
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/glibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/glibc
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  CROSS_COMPILE = $(srctree)/toolchain/$(TOOLCHAIN)/usr/bin/$(HOST)-

  # set optimization flags, etc.

  export CROSS_COMPILE
endif

