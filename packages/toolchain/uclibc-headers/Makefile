PACKAGE = uClibc
VERSION = 0.9.31

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk
exec-prefix = $(prefix)/$(TARGET)

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
	RUNTIME_PREFIX=$(exec-prefix)/sys-root/usr/ \
	DEVEL_PREFIX=$(exec-prefix)/sys-root/usr/ \
	PREFIX=$(SYSROOT)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

install-args = \
	RUNTIME_PREFIX=$(exec-prefix)/sys-root/usr/ \
	DEVEL_PREFIX=$(exec-prefix)/sys-root/usr/ \
	PREFIX=$(SYSROOT)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install_headers
	$(call cmd,stamp)
