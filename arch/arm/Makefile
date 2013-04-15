ARCH := $(subst $(quote),,$(CONFIG_ARCH))
CPU := $(subst $(quote),,$(CONFIG_CPU))
OS := $(subst $(quote),,$(CONFIG_OS))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))
ABI := $(subst $(quote),,$(CONFIG_ABI))

ifeq ($(CONFIG_OS_NONE),y)
  CPU :=
else
  ifneq ($(CPU),)
    CPU := $(CPU)-
  endif

  ifeq ($(LIBC),glibc)
    LIBC := gnu
  endif
endif

ifeq ($(CONFIG_ARCH_ARM_ARCH_V7),y)
  ifeq ($(CONFIG_ARCH_ARM_HARD_FP),y)
    ARCH := $(ARCH)v7

    ifeq ($(CONFIG_ARCH_ARM_ENDIAN_LITTLE),y)
      ARCH := $(ARCH)l
    else
      ARCH := $(ARCH)b
    endif
  endif
endif

ifeq ($(CONFIG_ARCH_ARM_HARD_FP),y)
  ABI := $(ABI)hf
endif

TARGET := $(ARCH)-$(CPU)$(OS)-$(LIBC)$(ABI)
export TARGET

CPPFLAGS = --sysroot $(SYSROOT)
export CPPFLAGS

#
# ABI flags
#

abiflags-$(CONFIG_ARCH_ARM_ENDIAN_BIG) += -mbig-endian
abiflags-$(CONFIG_ARCH_ARM_ENDIAN_LITTLE) += -mlittle-endian

abiflags-$(CONFIG_ARCH_ARM_HARD_FP) += -mfloat-abi=hard -D__ARM_PCS_VFP
abiflags-$(CONFIG_ARCH_ARM_SOFT_FP) += -mfloat-abi=softfp

abiflags-$(CONFIG_ARCH_ARM_ABI_EABI) += -mapcs -mabi=aapcs-linux -mno-thumb-interwork

ABIFLAGS = $(abiflags-y)

#
# CPU specific configuration
#

cpu-$(CONFIG_ARCH_ARM_CPU_GENERIC) := arch/arm/generic/Makefile
cpu-$(CONFIG_ARCH_ARM_CPU_XSCALE) := arch/arm/xscale/Makefile
cpu-$(CONFIG_ARCH_ARM_CPU_CORTEX_A9) := arch/arm/cortex-a9/Makefile
include $(cpu-y)

#
# default flags
#

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(SYSROOT)
export LDFLAGS
