PACKAGE = uClibc
VERSION = 0.9.31

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk

ifneq ($(ABI),)
DEF_CONFIG = $(CONFIG_ARCH)-$(CONFIG_ABI).config
CPU_CONFIG = $(CONFIG_ARCH)-$(CONFIG_CPU)-$(CONFIG_ABI).config
else
DEF_CONFIG = $(CONFIG_ARCH).config
CPU_CONFIG = $(CONFIG_ARCH)-$(CONFIG_CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

install-args = \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install_headers
	$(call cmd,stamp)
