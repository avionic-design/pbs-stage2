PACKAGE = busybox
VERSION = git

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
BUSYBOX_TREE = $(srctree)/../core/busybox.git
DESTDIR := $(pkgtree)/install

DEF_CONFIG = minimal
CPU_CONFIG = minimal-$(CONFIG_CPU)
DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_LDFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_CFLAGS="--sysroot $(SYSROOT)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(CONFIG_ARCH) \
	O=$(pkgbuildtree)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(BUSYBOX_TREE) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_LDFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_CFLAGS="--sysroot $(SYSROOT)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	ARCH=$(CONFIG_ARCH) \
	O=$(pkgbuildtree)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(BUSYBOX_TREE) && $(env) $(MAKE) $(build-args) -j $(NUM_CPU)
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_LDFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_CFLAGS="--sysroot $(SYSROOT)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(DESTDIR) \
	ARCH=$(CONFIG_ARCH) \
	O=$(pkgbuildtree)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(DESTDIR)/bin/busybox
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
