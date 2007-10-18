ARCH = x86_64
ARCH_LONG =
CPU = unknown
TUNE = generic
OS = linux
LIBC = gnu
FLOAT = hard
ABI = eabi
HOST = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT HOST

LINUX_VERSION = 2.6.23.1
GCC_VERSION = 4.2.2
export LINUX_VERSION GCC_VERSION

include platform/toolchain/common.mk

ifndef TOOLCHAIN
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/glibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/glibc
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/bootstrap
platform-clean: __clean-dirs += $(PLATFORM)/etc
platform-clean: __clean-dirs += $(PLATFORM)/lib
platform-clean: __clean-dirs += $(PLATFORM)/lib64
platform-clean: __clean-dirs += $(PLATFORM)/sbin
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
  ABIFLAGS =
  OPTFLAGS = \
	-g -O2 -m$(ARCH) -mtune=$(TUNE) -U$(ARCH)

ifeq ($(FLOAT),soft)
  ABIFLAGS += -msoft-float
else
  ABIFLAGS += -mhard-float
endif

  CPPFLAGS = --sysroot $(ROOTFS)
  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  LDFLAGS = \
	-s -shared-libgcc

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
endif

