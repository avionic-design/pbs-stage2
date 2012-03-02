include packages/toolchain/uclibc/Makefile.location
include packages/toolchain/common.mk
include packages/devel/uclibc/Makefile.dotconfig

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(CONFIG_ABI).config
CPU_CONFIG = $(ARCH)-$(CONFIG_CPU)-$(CONFIG_ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CONFIG_CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build

$(pkgtree)/.configure: $(pkgtree)/.patch $(pkgtree)/.dotconfig
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

install-args = \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install_headers
	$(call cmd,stamp)
