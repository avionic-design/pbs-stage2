PACKAGE = linux-2.6.git
VERSION = 000

include $(objtree)/include/config/auto.conf

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

env := env PATH=$(PATH)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(Q)$(env) $(MAKE) $(kernel)=$(pkgtree)/build config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(env) $(MAKE) $(kernel)=$(pkgtree)/build build
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(Q)$(env) $(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(env) $(MAKE) $(kernel)=$(pkgtree)/build install
	$(call cmd,stamp)

version = $(if $(wildcard $(pkgtree)/.release),$(shell cat $(pkgtree)/.release),)

include $(srctree)/packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-s $(DESTDIR) -b $(objtree)/binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-t $(TARGET) -v $(call version) -b $(objtree)/binary
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-t $(TARGET) -v $(call version) -r $(SYSROOT) \
			-b $(objtree)/binary
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build version
