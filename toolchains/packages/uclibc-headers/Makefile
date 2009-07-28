PACKAGE = uClibc
VERSION = $(uclibc_VERSION)

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include toolchains/packages/common.mk
exec-prefix = $(prefix)/$(TARGET)

ARCH := $(shell echo $(CONFIG_ARCH))
CPU  := $(shell echo $(CONFIG_CPU))
ABI  := $(shell echo $(CONFIG_ABI))
ARCH := $(subst bfin,blackfin,$(ARCH))

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(ABI).config
CPU_CONFIG = $(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	CROSS_COMPILE=$(SYSROOT)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/sys-root/usr/ \
	DEVEL_PREFIX=$(exec-prefix)/sys-root/usr/ \
	PREFIX=$(SYSROOT) \
	MAKEFLAGS=

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	CROSS_COMPILE=$(SYSROOT)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/sys-root/usr/ \
	DEVEL_PREFIX=$(exec-prefix)/sys-root/usr/ \
	PREFIX=$(SYSROOT)

$(pkgtree)/.install:
	cd $(pkgbuildtree) && $(env) $(priv) $(MAKE) $(install-args) install_headers
	$(call cmd,stamp)
