ARCH := $(shell echo $(CONFIG_ARCH))
CPU  := $(shell echo $(CONFIG_CPU))
OS   := $(shell echo $(CONFIG_OS))
LIBC := $(shell echo $(CONFIG_LIBC))

ifeq ($(LIBC),glibc)
  LIBC := gnu
endif

TARGET := $(CPU)-pc-$(OS)-$(LIBC)
export TARGET

CPPFLAGS = --sysroot $(objtree)/rootfs
export CPPFLAGS

CPU := $(shell echo $(CONFIG_CPU))
ifeq ($(CPU),)
  CPU := generic
endif

include arch/x86/$(CPU)/Makefile

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(objtree)/rootfs
export LDFLAGS
