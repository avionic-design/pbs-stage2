PACKAGE = busybox
VERSION = git

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
BUSYBOX_TREE = $(srctree)/../core/busybox.git
ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
LIBC := $(shell echo $(CONFIG_LIBC))
DESTDIR := $(pkgtree)/install

DEF_CONFIG = minimal
CPU_CONFIG = minimal-$(CPU)
DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	O=$(pkgbuildtree) \
	ARCH=$(ARCH)

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(BUSYBOX_TREE) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	O=$(pkgbuildtree) \
	ARCH=$(ARCH)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(BUSYBOX_TREE) && $(env) $(MAKE) $(build-args) -j $(NUM_CPU)
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_LDFLAGS="--sysroot $(ROOTFS)" \
	EXTRA_CFLAGS="--sysroot $(ROOTFS)" \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	CONFIG_PREFIX=$(DESTDIR) \
	O=$(pkgbuildtree) \
	ARCH=$(ARCH)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(DESTDIR)/bin/busybox
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
