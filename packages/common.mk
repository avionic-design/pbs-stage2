# common definitions for packages

INSTALL = install
SED = sed

SYSROOT ?= $(objtree)/sysroot
DESTDIR ?= $(pkgtree)/install
ROOTFS ?= $(objtree)/rootfs
prefix ?= /usr
export SYSROOT DESTDIR ROOTFS prefix

CONFIG_ARCH := $(subst $(quote),,$(CONFIG_ARCH))
CONFIG_CPU := $(subst $(quote),,$(CONFIG_CPU))
CONFIG_OS := $(subst $(quote),,$(CONFIG_OS))
CONFIG_LIBC := $(subst $(quote),,$(CONFIG_LIBC))
CONFIG_ABI := $(subst $(quote),,$(CONFIG_ABI))

include $(if $(KBUILD_SRC),$(srctree)/arch/$(CONFIG_ARCH)/Makefile)

TOOLCHAIN_BASE_PATH ?= $(srctree)/toolchains
PATH := $(TOOLCHAIN_BASE_PATH)/$(TARGET)/usr/bin:$(PATH)
CROSS_COMPILE ?= $(TARGET)-

export CROSS_COMPILE

CC = $(CROSS_COMPILE)gcc
CPP = $(CROSS_COMPILE)cpp
CXX = $(CROSS_COMPILE)g++
LD = $(CROSS_COMPILE)ld
AS = $(CROSS_COMPILE)as
AR = $(CROSS_COMPILE)ar
NM = $(CROSS_COMPILE)nm
RANLIB = $(CROSS_COMPILE)ranlib
STRIP = $(CROSS_COMPILE)strip

priv = fakeroot
env = env -i PATH=$(objtree)/build-tools/bin:$(PATH)
export priv env

ifdef CCACHE
env += CCACHE=$(CCACHE) CCACHE_DIR=$(srctree)/ccache
endif

NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
export NUM_CPU

# TODO: Find a less ugly way to unquote multi words strings
kpkg                  := $(shell echo $(PACKAGE) | tr a-z- A-Z_)
platform-env           = $(shell echo $(CONFIG_$(kpkg)_PLATFORM_ENV))
platform-conf-args     = $(shell echo $(CONFIG_$(kpkg)_PLATFORM_CONF_ARGS))
platform-conf-vars     = $(shell echo $(CONFIG_$(kpkg)_PLATFORM_CONF_VARS))
platform-build-args    = $(shell echo $(CONFIG_$(kpkg)_PLATFORM_BUILD_ARGS))
platform-install-args  = $(shell echo $(CONFIG_$(kpkg)_PLATFORM_INSTALL_ARGS))

env                   += $(platform-env)
conf-args             += $(platform-conf-args)
conf-vars             += $(platform-conf-vars)
build-args            += $(platform-build-args)
install-args          += $(platform-install-args)
