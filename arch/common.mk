ARCH := $(call unquote,$(CONFIG_ARCH))
export ARCH

MACHINE := $(or $(call unquote,$(CONFIG_MACHINE)),$(ARCH))
export MACHINE

VENDOR := $(call unquote,$(CONFIG_VENDOR))
export VENDOR

OS := $(call unquote,$(CONFIG_OS))
export OS

LIBC := $(call unquote,$(CONFIG_LIBC))
export LIBC

ABI := $(call unquote,$(CONFIG_ABI))
export ABI

MARCH := $(call unquote,$(CONFIG_MARCH))
export MARCH

# Define the target
TARGET := $(MACHINE)-$(if $(VENDOR),$(VENDOR)-)$(OS)-$(LIBC)$(ABI)
export TARGET

# Preprocessor flags
CPPFLAGS = --sysroot $(SYSROOT)
CPPFLAGS += $(CPPFLAGS-y)
export CPPFLAGS

# ABI releated flags
ABIFLAGS-$(if $(CONFIG_MARCH),y) += -march=$(MARCH)

ABIFLAGS =
ABIFLAGS += $(ABIFLAGS-y)

# Optimization flags

OPTFLAGS-$(CONFIG_DEBUG) += -g
OPTFLAGS-$(CONFIG_OPTIMIZATION_SIZE) += -Os
OPTFLAGS-$(CONFIG_OPTIMIZATION_SPEED) += -O2
OPTFLAGS-$(CONFIG_OPTIMIZATION_NONE) += -O0

OPTFLAGS =
OPTFLAGS += $(OPTFLAGS-y)

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(SYSROOT)
LDFLAGS += $(LDFLAGS-y)
export LDFLAGS
