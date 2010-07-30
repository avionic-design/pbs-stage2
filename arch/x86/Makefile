ARCH := $(subst $(quote),,$(CONFIG_ARCH))
CPU := $(subst $(quote),,$(CONFIG_CPU))
OS := $(subst $(quote),,$(CONFIG_OS))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))

ifeq ($(LIBC),glibc)
  LIBC := gnu
endif

TARGET := $(CPU)-pc-$(OS)-$(LIBC)
export TARGET

CPPFLAGS = --sysroot $(SYSROOT)
export CPPFLAGS

include arch/x86/$(CPU)/Makefile

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(SYSROOT)
export LDFLAGS
