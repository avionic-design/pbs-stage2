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

include $(srctree)/packages/cleanup.mk

ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
LIBC := $(shell echo $(CONFIG_LIBC))
ABI := $(shell echo $(CONFIG_ABI))

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR) -b $(objtree)/binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(call version) -b $(objtree)/binary
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(CONFIG_LIBC) -v $(call version) \
			-r $(SYSROOT) -b $(objtree)/binary
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version
