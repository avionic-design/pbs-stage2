PACKAGE = uClibc
VERSION = $(uclibc_VERSION)

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

CROSS_COMPILE	:= $(prefix)/bin/$(TARGET)-
prefix		:= $(subst $(CURDIR),,$(prefix))
SYSROOT		:= $(CURDIR)
exec-prefix	 = $(prefix)/$(TARGET)
sysroot		 = $(exec-prefix)/sys-root

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
	CROSS_COMPILE=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	MAKEFLAGS=

$(pkgtree)/.configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	PREFIX=$(SYSROOT)$(sysroot) \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/

$(pkgtree)/.install:
	cd $(pkgbuildtree) && $(env) $(priv) $(MAKE) $(install-args) install
	mv $(SYSROOT)$(sysroot)/usr/lib/*crt*.o $(SYSROOT)$(exec-prefix)/lib
	$(call cmd,stamp)
