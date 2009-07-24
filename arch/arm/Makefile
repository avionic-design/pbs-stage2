ARCH := $(shell echo $(CONFIG_ARCH))
CPU  := $(shell echo $(CONFIG_CPU))
OS   := $(shell echo $(CONFIG_OS))
LIBC := $(shell echo $(CONFIG_LIBC))
ABI  := $(shell echo $(CONFIG_ABI))

ifneq ($(CPU),)
  CPU := $(CPU)-
endif

ifeq ($(LIBC),glibc)
  LIBC := gnu
endif

TARGET := $(ARCH)-$(CPU)$(OS)-$(LIBC)$(ABI)
export TARGET

CPPFLAGS = --sysroot $(objtree)/rootfs
export CPPFLAGS

ifeq ($(ABI),eabi)
  ABIFLAGS = -mlittle-endian -mapcs -mabi=aapcs-linux -mno-thumb-interwork
else
  ABIFLAGS = -mlittle-endian
endif

CPU := $(shell echo $(CONFIG_CPU))
ifeq ($(CPU),)
  CPU := generic
endif

include arch/arm/$(CPU)/Makefile

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(objtree)/rootfs
export LDFLAGS
