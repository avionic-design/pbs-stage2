PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= $(srctree)/../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel

##############################################################################

ARCH = $(CONFIG_ARCH)
export ARCH

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

include packages/common.mk

$(pkgtree)/build:
	$(call cmd,mkdir_p)

$(pkgtree)/.configure: $(pkgtree)/build
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build config

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build build

$(pkgtree)/.binary:
	@echo "not implemented yet"

$(pkgtree)/.install:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build install

$(pkgtree)/.clean:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build clean

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version

