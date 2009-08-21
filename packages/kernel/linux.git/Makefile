PACKAGE = linux-2.6.git
VERSION = 000

KERNELSRC ?= $(srctree)/../linux-2.6.git
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

include packages/common.mk

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

$(pkgtree)/.binary: $(pkgtree)/.do-install
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(priv) mkdir -p $(ROOTFS)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version
