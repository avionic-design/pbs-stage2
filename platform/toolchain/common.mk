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

  ABIFLAGS  =
  OPTFLAGS  =

  CFLAGS = \
	$(CPPFLAGS) \
	$(ABIFLAGS) \
	$(OPTFLAGS)

  LDFLAGS =

  export ABIFLAGS OPTFLAGS CPPFLAGS CFLAGS LDFLAGS
endif

