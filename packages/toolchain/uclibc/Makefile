PACKAGE = uClibc
VERSION = 0.9.31

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk

ifneq ($(CONFIG_ABI),)
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
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	-j $(NUM_CPU)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	mv $(sysroot)/usr/lib/*crt*.o $(exec-prefix)/lib
	$(call cmd,stamp)
