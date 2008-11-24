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

  LDFLAGS =

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
else
  # default versions
  LINUX_VERSION ?= 2.6.27.7
  export LINUX_VERSION

  BINUTILS_VERSION  ?= 2.19
  BINUTILS_SNAPSHOT ?= 2.18.50.0.8
  export BINUTILS_VERSION BINUTILS_SNAPSHOT

  GCC_VERSION  ?= 4.3.2
  GCC_SNAPSHOT ?= 4.4-20080725
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
    packages-y  = toolchain/linux-headers
    packages-y += toolchain/binutils
    packages-y += toolchain/gcc-core
    ifeq ($(LIBC),uclibc)
      packages-y += toolchain/uclibc
    else
      packages-y += toolchain/glibc
    endif
    packages-y += toolchain/gcc
    packages-y += toolchain/gdb
    packages-y += toolchain/pkg-config
  endif
endif

