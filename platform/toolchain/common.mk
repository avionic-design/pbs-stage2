# common definitions for toolchain platforms

ifdef TOOLCHAIN
  TOOLCHAIN_ROOT = $(srctree)/platform/toolchain/$(TOOLCHAIN)
  CROSS_COMPILE = $(TOOLCHAIN_ROOT)/usr/bin/$(HOST)-
  export TOOLCHAIN_ROOT CROSS_COMPILE

  # FIXME: does this really belong here? it doesn't have anything to do with
  # the toolchain
  SYSROOT ?= $(PLATFORM)/rootfs
  export SYSROOT

  ABIFLAGS  =
  OPTFLAGS  =
  CPPFLAGS += \
	--sysroot=$(SYSROOT)

  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  LDFLAGS =

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
endif

