ARCH = arm
OS = wince
LIBC = pe
HOST = $(ARCH)-$(OS)-$(LIBC)
export ARCH OS LIBC HOST

GCC_VERSION = 4.3.0
export GCC_VERSION

include platform/toolchain/common.mk

ifndef TOOLCHAIN
  packages-y += toolchain/binutils
#  packages-y += toolchain/newlib
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/bootstrap
platform-clean: __clean-dirs += $(PLATFORM)/etc
platform-clean: __clean-dirs += $(PLATFORM)/lib
platform-clean: __clean-dirs += $(PLATFORM)/sbin
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
# for EABI
#  ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
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

  CPPFLAGS = --sysroot $(ROOTFS)
  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  LDFLAGS = \
	-s -shared-libgcc

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
endif

