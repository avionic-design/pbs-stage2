PACKAGE = uClibc
VERSION = $(uclibc_VERSION)

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(ABI).config
CPU_CONFIG = $(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS) \
	MAKEFLAGS=

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

$(pkgtree)/.install:
	cd $(pkgbuildtree) && $(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)
