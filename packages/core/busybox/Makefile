PACKAGE = busybox
VERSION = 1.20.2
LICENSE = GPL

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)
DESTDIR := $(pkgtree)/install

DEF_CONFIG = minimal
CPU_CONFIG = minimal-$(CONFIG_CPU)
CONFIGS = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))


ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_MODUTILS),y)
  CONFIGS += modutils-y
else
  CONFIGS += modutils-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_XZ),y)
  CONFIGS += xz-y
else
  CONFIGS += xz-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_UTIL_LINUX),y)
  CONFIGS += util-linux-y
else
  CONFIGS += util-linux-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_COREUTILS),y)
  CONFIGS += coreutils-y
else
  CONFIGS += coreutils-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_PROCPS),y)
  CONFIGS += procps-y
else
  CONFIGS += procps-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_PSMISC),y)
  CONFIGS += psmisc-y
else
  CONFIGS += psmisc-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_BRIDGE_UTILS),y)
  CONFIGS += bridge-utils-y
else
  CONFIGS += bridge-utils-n
endif

ifeq ($(CONFIG_PACKAGE_CORE_BUSYBOX_NTPD),y)
  CONFIGS += ntpd-y
else
  CONFIGS += ntpd-n
endif

CONFIGS := $(addprefix $(pkgsrctree)/conf/,$(CONFIGS))

$(pkgtree)/.setup:
	$(call cmd,stamp)

common-args = \
	EXTRA_CPPFLAGS="$(CPPFLAGS)" \
	EXTRA_LDFLAGS="$(LDFLAGS)" \
	EXTRA_CFLAGS="$(CFLAGS)" \
	CROSS_COMPILE=$(TARGET)- \
	ARCH=$(CONFIG_ARCH)

conf-args = \
	$(common-args) \
	TOOLCHAIN_BASE_PATH=$(TOOLCHAIN_BASE_PATH) \
	check-lxdialog=$(srctree)/scripts/kconfig/lxdialog/check-lxdialog.sh

$(pkgbuildtree)/.config:
	cat $(CONFIGS) > $@

$(pkgtree)/.configure: $(pkgtree)/.patch $(pkgbuildtree)/.config
	cd $(pkgbuildtree) && $(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	$(common-args)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	$(common-args) \
	CONFIG_PREFIX=$(DESTDIR) \

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) chmod u+s $(DESTDIR)/bin/busybox
	$(call cmd,stamp)

PHONY += configure
configure:
	cd $(pkgbuildtree) && \
		$(env) TERM=$(TERM) $(MAKE) $(conf-args) menuconfig

include packages/cleanup.mk
include packages/binary.mk
