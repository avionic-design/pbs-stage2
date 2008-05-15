ARCH = arm
ARCH_LONG = armv4t
CPU = xscale
TUNE = strongarm110
OS = linux
LIBC = uclibc
FLOAT = soft
ABI = oabi
TARGET = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT TARGET

LINUX_VERSION = 2.6.25.3
GCC_VERSION = 4.2.3
export LINUX_VERSION GCC_VERSION

variant = sysroot
export variant

include platform/toolchain/common.mk

ifndef TOOLCHAIN
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/uclibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/uclibc
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)/bootstrap
platform-clean: __clean-dirs  += $(PLATFORM)/lib
platform-clean: __clean-dirs  += $(PLATFORM)/usr
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
ifeq ($(ABI),eabi)
  ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
else
  ABIFLAGS = -mlittle-endian
endif
  OPTFLAGS = \
	-g -Os -m$(ARCH) -march=$(ARCH_LONG) -mtune=$(TUNE) \
	-Wa,-mcpu=$(CPU) -U$(ARCH)

ifeq ($(FLOAT),soft)
  ABIFLAGS += -msoft-float
else
  ABIFLAGS += -mhard-float
endif

  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  LDFLAGS = \
	-s -shared-libgcc

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
endif

