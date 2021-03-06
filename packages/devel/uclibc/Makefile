PACKAGE = uClibc-ng
VERSION = 1.0.24
LICENSE = LGPL

LOCATION = https://downloads.uclibc-ng.org/releases/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/common.mk
include packages/devel/uclibc/Makefile.dotconfig

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
DESTDIR := $(pkgtree)/install

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	KERNEL_HEADERS="$(SYSROOT)$(prefix)/include" \
	CROSS=$(CROSS_COMPILE) \
	TOOLCHAIN_BASE_PATH=$(TOOLCHAIN_BASE_PATH) \
	check-lxdialog=$(srctree)/scripts/kconfig/lxdialog/check-lxdialog.sh \
	O=$(pkgtree)/build

$(pkgtree)/.configure: $(pkgtree)/.dotconfig
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	KERNEL_HEADERS=$(SYSROOT)$(prefix)/include \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(DESTDIR) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/ \
	O=$(pkgtree)/build

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args) utils
	$(call cmd,stamp)

install-args = \
	KERNEL_HEADERS=$(SYSROOT)$(prefix)/include \
	CROSS=$(CROSS_COMPILE) \
	PREFIX=$(DESTDIR) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=$(prefix)/ \
	O=$(pkgtree)/build

dest-dirs = \
	$(DESTDIR)/etc/init.d \
	$(DESTDIR)/etc/rcS.d

quiet_cmd_priv_mkdir_p = MKDIR   $@
      cmd_priv_mkdir_p = $(priv) mkdir -p $@

$(dest-dirs):
	$(call cmd,priv_mkdir_p)

$(pkgtree)/.do-install: $(pkgtree)/.build $(dest-dirs)
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install install_utils
	$(call cmd,stamp)

stripfiles = \
	/lib/ld-uClibc-$(VERSION).so \
	/lib/libthread-db*.so \
	/lib/libuClibc-$(VERSION).so \
	$(prefix)/bin/ldd \
	$(prefix)/bin/getconf \
	/sbin/ldconfig

include packages/cleanup.mk
include packages/binary.mk

PHONY += configure
configure:
	cd $(pkgbuildtree) && \
		$(env) TERM=$(TERM) $(MAKE) $(conf-args) menuconfig
