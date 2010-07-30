# common definitions for packages

INSTALL  = /usr/bin/install
SYSROOT ?= $(objtree)/sysroot
DESTDIR ?= $(pkgtree)/install
ROOTFS  ?= $(objtree)/rootfs
prefix  ?= /usr
export SYSROOT DESTDIR ROOTFS prefix

CONFIG_ARCH := $(shell echo $(CONFIG_ARCH))
CONFIG_CPU := $(shell echo $(CONFIG_CPU))
CONFIG_OS := $(shell echo $(CONFIG_OS))
CONFIG_LIBC := $(shell echo $(CONFIG_LIBC))
CONFIG_ABI := $(shell echo $(CONFIG_ABI))

include $(if $(KBUILD_SRC),$(srctree)/arch/$(CONFIG_ARCH)/Makefile)
ifdef CONFIG_CROSS_COMPILE
  ifeq ($(origin CONFIG_CROSS_COMPILE), "command line")
    CROSS_COMPILE = $(CONFIG_CROSS_COMPILE)
  endif
endif
ifndef CROSS_COMPILE
  TOOLCHAIN_PATH = $(srctree)/toolchains/$(TARGET)/usr/bin
  CROSS_COMPILE = $(TOOLCHAIN_PATH)/$(TARGET)-
endif

export CROSS_COMPILE

CC     = $(CROSS_COMPILE)gcc
CPP    = $(CROSS_COMPILE)cpp
CXX    = $(CROSS_COMPILE)g++
LD     = $(CROSS_COMPILE)ld
AS     = $(CROSS_COMPILE)as
AR     = $(CROSS_COMPILE)ar
NM     = $(CROSS_COMPILE)nm
RANLIB = $(CROSS_COMPILE)ranlib
STRIP  = $(CROSS_COMPILE)strip

set-args = $(foreach arg, $(1), $(arg)='$($(arg))')

priv = sudo
env  = env -i PATH=$(objtree)/build-tools/bin:$(TOOLCHAIN_PATH):$(PATH)
export priv env

NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
export NUM_CPU
