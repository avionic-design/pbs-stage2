PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= $(srctree)/../linux-2.6.git
export KERNELSRC

DESCRIPTION = Linux kernel

##############################################################################

include $(objtree)/include/config/auto.conf
ARCH = $(CONFIG_ARCH)
KERNEL_CONFIG = $(CONFIG_KERNEL_CONFIG)
export ARCH KERNEL_CONFIG

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

include packages/common.mk

$(pkgtree)/build:
	$(call cmd,mkdir_p)

$(pkgtree)/.configure: $(pkgtree)/build
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build build
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.build
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build install
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version

