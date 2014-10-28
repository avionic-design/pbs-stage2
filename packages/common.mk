# common definitions for packages

INSTALL = install
SED = sed

SYSROOT ?= $(objtree)/sysroot
BUILD_TOOLS ?= $(objtree)/build-tools
DESTDIR ?= $(pkgtree)/install
ROOTFS ?= $(objtree)/rootfs
prefix ?= /usr
export SYSROOT DESTDIR ROOTFS prefix

CONFIG_ARCH := $(call unquote,$(CONFIG_ARCH))
CONFIG_CPU := $(call unquote,$(CONFIG_CPU))
CONFIG_OS := $(call unquote,$(CONFIG_OS))
CONFIG_LIBC := $(call unquote,$(CONFIG_LIBC))
CONFIG_ABI := $(call unquote,$(CONFIG_ABI))

include $(if $(KBUILD_SRC),$(srctree)/arch/$(CONFIG_ARCH)/Makefile)

PATH := $(BUILD_TOOLS)/bin:$(PATH)
LD_LIBRARY_PATH := $(BUILD_TOOLS)/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))
LOCPATH := $(BUILD_TOOLS)/lib/locale$(if $(LOCPATH),:$(LOCPATH))
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

BUILD_CPPFLAGS = -I$(BUILD_TOOLS)/include
BUILD_CFLAGS =
BUILD_CXXFLAGS =
BUILD_ASFLAGS =
BUILD_LDFLAGS = -L$(BUILD_TOOLS)/lib

HOST_GNU_TYPE = $(shell $(srctree)/support/config.sub $(TARGET))
BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

priv = fakeroot
env = env -i PATH=$(PATH) LD_LIBRARY_PATH=$(LD_LIBRARY_PATH) HOME=$(HOME) \
	$(and $(CONFIG_WITH_BUILD_TOOLS_LOCALES),LOCPATH=$(LOCPATH))
export priv env

# various environment that are generally needed but can still be disabled
PKG_CONFIG_LIBDIR = $(SYSROOT)$(prefix)/lib/pkgconfig:$(SYSROOT)$(prefix)/share/pkgconfig:$(BUILD_TOOLS)/share/pkgconfig
PKG_CONFIG_SYSROOT_DIR = $(SYSROOT)
ACLOCAL_PATH = $(SYSROOT)$(prefix)/share/aclocal:$(BUILD_TOOLS)/share/aclocal:$(TOOLCHAIN_BASE_PATH)/share/aclocal

env += \
	$(if $(PKG_CONFIG_LIBDIR),PKG_CONFIG_LIBDIR=$(PKG_CONFIG_LIBDIR)) \
	$(if $(PKG_CONFIG_SYSROOT_DIR),PKG_CONFIG_SYSROOT_DIR=$(PKG_CONFIG_SYSROOT_DIR)) \
	$(if $(ACLOCAL_PATH),ACLOCAL_PATH=$(ACLOCAL_PATH)) \

ifdef CCACHE
env += CCACHE=$(CCACHE)
ifdef CCACHE_DIR
env += CCACHE_DIR=$(CCACHE_DIR)
else
env += CCACHE_DIR=$(srctree)/ccache
endif
endif

ifdef DISTCC
ifdef CCACHE
env += CCACHE_PREFIX=$(DISTCC)
else
env += CCACHE=$(DISTCC)
endif
ifeq ($(NUM_CPU),)
NUM_CPU = $(shell $(DISTCC) -j 2> /dev/null)
endif
endif

ifeq ($(NUM_CPU),)
NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
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
