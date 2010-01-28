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

#
# ABI flags
#

abiflags-$(CONFIG_ARCH_ARM_ENDIAN_BIG) += -mbig-endian
abiflags-$(CONFIG_ARCH_ARM_ENDIAN_LITTLE) += -mlittle-endian

abiflags-$(CONFIG_ARCH_ARM_ABI_EABI) += -mapcs -mabi=aapcs-linux -mno-thumb-interwork

ABIFLAGS = $(abiflags-y)

#
# CPU specific configuration
#

CPU := $(shell echo $(CONFIG_CPU))
ifeq ($(CPU),)
  CPU := generic
endif

include arch/arm/$(CPU)/Makefile

#
# default flags
#

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(objtree)/rootfs
export LDFLAGS
