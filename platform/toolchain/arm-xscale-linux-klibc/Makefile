ARCH = arm
ARCH_LONG = armv5te
CPU = xscale
TUNE = xscale
OS = linux
LIBC = klibc
HOST = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
export ARCH ARCH_LONG CPU TUNE OS LIBC HOST

GCC_VERSION = 4.2.0
export GCC_VERSION

include platform/toolchain/common.mk

ifndef TOOLCHAIN
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/klibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/klibc
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/lib
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
  ABIFLAGS =
  OPTFLAGS = \
	-g -Os -m$(ARCH) -march=$(ARCH_LONG) -mtune=$(TUNE) \
	-Wa,-mcpu=$(CPU) -msoft-float -U$(ARCH)

  LDFLAGS = \
	-s -Wl,--dynamic-linker,/lib/ld-klibc.so.0 -shared-libgcc
endif

