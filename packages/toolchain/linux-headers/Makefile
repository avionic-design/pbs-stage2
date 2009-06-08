PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.de.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk
prefix := $(prefix)/$(TARGET)

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

KERNELSRC	= $(pkgbuildtree)
KERNEL_CONFIG	= defconfig
export KERNELSRC KERNEL_CONFIG

$(pkgtree)/.configure:
	$(Q)$(MAKE) $(kernel)=$(pkgtree) config
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(Q)$(MAKE) $(kernel)=$(pkgtree) headers-check
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

$(pkgtree)/.install:
	$(Q)$(MAKE) $(kernel)=$(pkgtree) headers-install
	$(call cmd,stamp)

kernel-version:
	$(Q)$(MAKE) $(kernel)=$(pkgtree) version
