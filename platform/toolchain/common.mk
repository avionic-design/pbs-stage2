# common definitions for toolchain platforms

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
	--sysroot=$(SYSROOT)
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
endif

