PACKAGE = linux-2.6.git
VERSION = git

include $(objtree)/include/config/auto.conf
-include $(pkgtree)/kernel-release

KERNELSRC := "$(srctree)/$(subst $(quote),,$(CONFIG_KERNEL_SOURCE))"
ARCH := $(subst $(quote),,$(CONFIG_ARCH))
export KERNELSRC ARCH

KERNEL_CONFIG = $(CONFIG_KERNEL_CONFIG)
DESTDIR = $(pkgtree)/install
export KERNEL_CONFIG DESTDIR

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

include $(srctree)/packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build build
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build install
	$(call cmd,stamp)

include $(srctree)/packages/cleanup.mk
include $(srctree)/packages/binary.mk
