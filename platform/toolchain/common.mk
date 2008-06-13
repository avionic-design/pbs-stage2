# common definitions for toolchain platforms

variant ?= sysroot
export variant

# default versions
LINUX_VERSION ?= 2.6.25.4
export LINUX_VERSION

BINUTILS_VERSION  ?= 2.18
BINUTILS_SNAPSHOT ?= 2.18.50.0.7
export BINUTILS_VERSION BINUTILS_SNAPSHOT

GCC_VERSION  ?= 4.2.4
GCC_SNAPSHOT ?= 4.4-20080516
export GCC_VERSION GCC_SNAPSHOT

ifeq ($(LIBC),uclibc)
  LIBC_VERSION ?= 0.9.29
else
  LIBC_VERSION ?= 2.7
endif

export LIBC_VERSION

# assembler, compiler and linker flags
ifdef TOOLCHAIN
  ifeq ($(variant),sysroot)
    TOOLCHAIN_ROOT = $(srctree)/platform/toolchain/$(TOOLCHAIN)
  endif

  CROSS_COMPILE = $(TOOLCHAIN_ROOT)$(prefix)/bin/$(TARGET)-
  export TOOLCHAIN_ROOT CROSS_COMPILE

  ifeq ($(variant),sysroot)
    # FIXME: does this really belong here? it doesn't have anything to do with
    # the toolchain
    SYSROOT ?= $(PLATFORM)/rootfs
    export SYSROOT

    CPPFLAGS += \
	--sysroot $(SYSROOT)
  endif

  # set optimization flags, etc.
  ifeq ($(ARCH),arm)
    ifeq ($(ABI),eabi)
      ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
    else
      ABIFLAGS = -mlittle-endian
    endif

    OPTFLAGS = \
	-g -Os -m$(ARCH) -march=$(ARCH_LONG) -mtune=$(TUNE) \
	-Wa,-mcpu=$(CPU) -U$(ARCH)
  else
    OPTFLAGS =
  endif

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
	-s --shared-libgcc

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
else
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  ifeq ($(LIBC),uclibc)
    packages-y += toolchain/uclibc-headers
  else
    packages-y += toolchain/glibc-headers
  endif
  packages-y += toolchain/gcc-core
  ifeq ($(LIBC),uclibc)
    packages-y += toolchain/uclibc
  else
    packages-y += toolchain/glibc
  endif
  packages-y += toolchain/gcc
  packages-y += toolchain/pkg-config
endif

