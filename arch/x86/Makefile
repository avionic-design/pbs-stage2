TARGET  = $(CONFIG_CPU)-pc-
TARGET := $(TARGET)$(CONFIG_OS)-
TARGET := $(TARGET)$(CONFIG_LIBC)
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
