# common definitions for toolchain platforms

ROOTFS  ?= $(PLATFORM)
tprefix ?= /opt/cross
prefix  ?= $(tprefix)
variant ?= sysroot
export ROOTFS tprefix prefix variant

# assembler, compiler and linker flags
ifdef TOOLCHAIN
  ifeq ($(variant),sysroot)
    TOOLCHAIN_ROOT = $(srctree)/platform/toolchain/$(TOOLCHAIN)
  endif

  CROSS_COMPILE = $(TOOLCHAIN_ROOT)$(tprefix)/bin/$(TARGET)-
  export TOOLCHAIN_ROOT CROSS_COMPILE

  ifeq ($(variant),sysroot)
    SYSROOT ?= $(ROOTFS)
    export SYSROOT

    CPPFLAGS += \
	--sysroot $(SYSROOT)
  endif

  # set optimization flags, etc.
  OPTFLAGS =

  # ARM
  ifeq ($(ARCH),arm)
    ifeq ($(ABI),eabi)
      ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
    else
      ABIFLAGS = -mlittle-endian
    endif

    OPTFLAGS = \
	-g -Os -m$(ARCH) -march=$(ARCH_LONG) -mtune=$(TUNE) \
	-Wa,-mcpu=$(CPU) -U$(ARCH)
  endif

  # Intel x86
  ifeq ($(ARCH),i686)
    OPTFLAGS = -O2 -g
  endif

  ifeq ($(ARCH),i786)
    OPTFLAGS = -O2 -g
  endif

  # floating point variants
  ifeq ($(FLOAT),soft)
    ABIFLAGS += -msoft-float
  else
    ifeq ($(FLOAT),hard)
      ABIFLAGS += -mhard-float
    else
      ABIFLAGS +=
    endif
  endif

  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  CXXFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  ifeq ($(variant),sysroot)
    LDFLAGS = --sysroot $(SYSROOT)
  else
    LDFLAGS =
  endif

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
else
  # default versions
  LINUX_VERSION ?= 2.6.28.1
  export LINUX_VERSION

  BINUTILS_VERSION  ?= 2.19
  BINUTILS_SNAPSHOT ?= 2.18.50.0.8
  export BINUTILS_VERSION BINUTILS_SNAPSHOT

  GCC_VERSION  ?= 4.3.2
  GCC_SNAPSHOT ?= 4.4-20081121
  export GCC_VERSION GCC_SNAPSHOT

  ifeq ($(LIBC),newlib)
    LIBC_VERSION ?= 1.16.0
  else
    ifeq ($(LIBC),uclibc)
      LIBC_VERSION ?= 0.9.30
    else
      LIBC_VERSION ?= 2.7
    endif
  endif

  export LIBC_VERSION

  ifeq ($(LIBC),newlib)
    packages-y  = toolchain/binutils
    packages-y += toolchain/gcc
    packages-y += toolchain/newlib
  else
    libc := $(shell echo $(LIBC) | sed -e s/gnu/glibc/)
    packages-y  = toolchain/linux-headers
    packages-y += toolchain/binutils
    packages-y += toolchain/gcc-core
    packages-y += toolchain/$(libc)
    packages-y += toolchain/gcc
    packages-y += toolchain/$(libc)-cleanup
    packages-y += toolchain/gdb
    packages-y += toolchain/pkg-config
  endif
endif

