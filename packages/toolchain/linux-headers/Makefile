PACKAGE = linux
VERSION = 3.3

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.kernel.org/pub/linux/kernel/v$(MAJOR).x
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/common.mk

ARCH := $(call unquote,$(CONFIG_ARCH))
ARCH := $(patsubst mips%,mips,$(ARCH))
ARCH := $(patsubst i%86,x86,$(ARCH))

common-args = --no-print-directory -j $(NUM_CPU)
common-vars = \
	KBUILD_OUTPUT='$(pkgtree)/build' \
	CROSS_COMPILE='$(TARGET)-' \
	ARCH='$(ARCH)'

KERNEL_CONFIG := defconfig

$(pkgtree)/build:
	$(call cmd,mkdir_p)

$(pkgtree)/.setup: | $(pkgtree)/build
	$(call cmd,stamp)

conf-args = $(common-args)
conf-vars = $(common-vars)

quiet_cmd_configure = CONFIG  $(KERNEL_CONFIG)
      cmd_configure = $(env) $(MAKE) -C $(pkgbuildtree) $(conf-args) $(conf-vars) $(KERNEL_CONFIG)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,configure)
	$(call cmd,stamp)

build-args = $(common-args)
build-vars = $(common-vars)

quiet_cmd_check_headers = CHECK   headers
      cmd_check_headers = $(env) $(MAKE) -C $(pkgbuildtree) $(build-args) $(build-vars) headers_check

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,check_headers)
	$(call cmd,stamp)

install-args = $(common-args)
install-vars = \
	INSTALL_HDR_PATH=$(sysroot)/usr \
	$(common-vars)

quiet_cmd_install_headers = INSTALL headers
      cmd_install_headers = $(env) $(MAKE) -C $(pkgbuildtree) $(install-args) $(install-vars) headers_install

$(pkgtree)/.install: $(pkgtree)/.build
	$(call cmd,install_headers)
	$(call cmd,stamp)
