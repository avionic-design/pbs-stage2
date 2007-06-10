# common definitions for toolchain platforms

ifdef TOOLCHAIN
  TOOLCHAIN_ROOT = $(srctree)/platform/toolchain/$(TOOLCHAIN)
  CROSS_COMPILE = $(TOOLCHAIN_ROOT)/usr/bin/$(HOST)-
  export TOOLCHAIN_ROOT CROSS_COMPILE
endif

