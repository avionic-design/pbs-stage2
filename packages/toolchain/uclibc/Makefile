PACKAGE = uClibc
VERSION = 0.9.31

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk

CROSS_COMPILE := $(prefix)/bin/$(TARGET)-
prefix := $(subst $(CURDIR),,$(prefix))
SYSROOT := $(CURDIR)
exec-prefix = $(prefix)/$(TARGET)
sysroot = $(exec-prefix)/sys-root

ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
ABI := $(shell echo $(CONFIG_ABI))
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
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	-j $(NUM_CPU)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/

$(pkgtree)/.install:
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	mv $(SYSROOT)$(sysroot)/usr/lib/*crt*.o $(SYSROOT)$(exec-prefix)/lib
	$(call cmd,stamp)
