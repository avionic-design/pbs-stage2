# common definitions for packages

INSTALL = /usr/bin/install
ROOTFS ?= $(objtree)/rootfs
prefix ?= /usr
export ROOTFS prefix

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
  CROSS_COMPILE = $(srctree)/toolchains/opt/cross/bin/$(TARGET)
endif

export CROSS_COMPILE

CC     = $(CROSS_COMPILE)gcc
CPP    = $(CROSS_COMPILE)cpp
CXX    = $(CROSS_COMPILE)g++
LD     = $(CROSS_COMPILE)ld
AS     = $(CROSS_COMPILE)as
AR     = $(CROSS_COMPILE)ar
RANLIB = $(CROSS_COMPILE)ranlib
STRIP  = $(CROSS_COMPILE)strip

set-args = $(foreach arg, $(1), $(arg)='$($(arg))')

priv = sudo
env  = env -i PATH=$(TOOLCHAIN_ROOT)$(tprefix)/bin:$(PATH)
export priv env

quiet_cmd_install = INSTALL   $(subst $(ROOTFS),,$3)
      cmd_install = $(priv) install $2 $3

quiet_cmd_install_bin = INSTALL   $(subst $(ROOTFS),,$3)
      cmd_install_bin = $(priv) install --mode 755 $2 $3

quiet_cmd_install_dir = INSTALL   $(subst $(ROOTFS),,$2)
      cmd_install_dir = $(priv) install -d --mode 755 $2

quiet_cmd_link = LN        $(subst $(ROOTFS),,$3) -> $2
      cmd_link = $(priv) ln -sf $2 $3

