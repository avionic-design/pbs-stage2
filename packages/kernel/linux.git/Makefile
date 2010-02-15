PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= $(srctree)/$(CONFIG_KERNEL_SOURCE)
export KERNELSRC

DESCRIPTION = Linux kernel

##############################################################################

include $(objtree)/include/config/auto.conf
ARCH = $(CONFIG_ARCH)
LIBC = $(shell echo $(CONFIG_LIBC))
KERNEL_CONFIG = $(CONFIG_KERNEL_CONFIG)
DESTDIR = $(pkgtree)/install
export ARCH KERNEL_CONFIG DESTDIR

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

include $(srctree)/packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build build
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build install
	$(call cmd,stamp)

version = $(if $(wildcard $(pkgtree)/.release),$(shell cat $(pkgtree)/.release),)
$(pkgtree)/.binary:  VERSION = $(call version)
$(pkgtree)/.install: VERSION = $(call version)

include $(srctree)/packages/cleanup.mk
include $(srctree)/packages/binary.mk

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version
