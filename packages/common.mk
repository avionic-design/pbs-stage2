# common definitions for packages

INSTALL = /usr/bin/install
prefix ?= /usr

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

