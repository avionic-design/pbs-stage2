TARGET := $(CONFIG_ARCH)-

ifneq ($(CONFIG_CPU),)
  TARGET := $(TARGET)$(CONFIG_CPU)-
endif

TARGET := $(TARGET)$(CONFIG_OS)-
TARGET := $(TARGET)$(CONFIG_LIBC)

ifneq ($(CONFIG_ABI),)
  TARGET := $(TARGET)$(CONFIG_ABI)-
else
  TARGET := $(TARGET)-
endif

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
