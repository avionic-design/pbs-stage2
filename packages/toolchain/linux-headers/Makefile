PACKAGE = linux
VERSION = 3.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.de.kernel.org/pub/linux/kernel/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/toolchain/common.mk

ARCH := $(CONFIG_ARCH)
export ARCH

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

KERNELSRC = $(pkgbuildtree)
KERNEL_CONFIG = defconfig
export KERNELSRC KERNEL_CONFIG

DESTDIR := $(sysroot)
prefix := /usr
export DESTDIR prefix

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(Q)$(MAKE) $(kernel)=$(pkgtree) config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree) headers-check
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.build
	$(Q)$(MAKE) $(kernel)=$(pkgtree) headers-install
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree) version
