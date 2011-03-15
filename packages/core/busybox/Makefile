PACKAGE = busybox
VERSION = 1.18.4

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
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
	CROSS_COMPILE=$(TARGET)- \
	ARCH=$(CONFIG_ARCH)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	EXTRA_CPPFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_LDFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_CFLAGS="--sysroot $(SYSROOT)" \
	CROSS_COMPILE=$(TARGET)- \
	ARCH=$(CONFIG_ARCH)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_LDFLAGS="--sysroot $(SYSROOT)" \
	EXTRA_CFLAGS="--sysroot $(SYSROOT)" \
	CROSS_COMPILE=$(TARGET)- \
	CONFIG_PREFIX=$(DESTDIR) \
	ARCH=$(CONFIG_ARCH)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(DESTDIR)/bin/busybox
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
