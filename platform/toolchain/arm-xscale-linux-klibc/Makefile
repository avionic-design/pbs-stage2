ARCH = arm
ARCH_LONG = armv4t
CPU = xscale
TUNE = strongarm110
OS = linux
LIBC = klibc
FLOAT = soft
ABI = eabi
HOST = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT HOST

LINUX_VERSION = 2.6.23.1
GCC_VERSION = 4.2.2
export LINUX_VERSION GCC_VERSION

BROKEN = yes
export BROKEN

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
# for EABI
# ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
# for OABI
  ABIFLAGS = -mlittle-endian
  OPTFLAGS = \
	-g -Os -m$(ARCH) -march=$(ARCH_LONG) -mtune=$(TUNE) \
	-Wa,-mcpu=$(CPU) -U$(ARCH)

ifeq ($(FLOAT),soft)
  ABIFLAGS += -msoft-float
else
  ABIFLAGS += -mhard-float
endif

  LDFLAGS = \
	-s -Wl,--dynamic-linker,/lib/ld-klibc.so.0 -shared-libgcc
endif

