PACKAGE = linux
LICENSE = GPL

include packages/common.mk
include include/config/depends-dirs.mk

#
# select images on a per-architecture basis
#

  image-blackfin = vmImage
install-blackfin = install

  image-mips = vmlinux
install-mips = install

  image-x86 = bzImage
install-x86 = install

  image-x86_64 = bzImage
install-x86_64 = install

  image-arm = zImage
install-arm = zinstall

image = $(or $(call unquote,$(CONFIG_PACKAGE_KERNEL_LINUX_IMAGE)), \
             $(image-$(ARCH)), \
             zImage)

install-target = $(or $(call unquote,$(CONFIG_PACKAGE_KERNEL_LINUX_INSTALL_TARGET)), \
                      $(install-$(ARCH)), \
                      zinstall)

#
# setup source directory depending on source configuration
#

ifeq ($(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_TARBALL),y)
  LOCATION := $(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_TARBALL_URL)
  LOCATION := $(call unquote,$(LOCATION))
  TARBALLS := $(lastword $(subst /, ,$(LOCATION)))
  LOCATION := $(subst /$(TARBALLS),,$(LOCATION))

  pkgbuildtree = $(pkgtree)/$(firstword $(subst .tar, ,$(TARBALLS)))
  KERNELSRC = $(pkgbuildtree)
endif

ifeq ($(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_GIT),y)
  GIT_URL := $(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_GIT_URL)
  GIT_URL := $(call unquote,$(GIT_URL))
  GIT_CHECKOUT := $(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_GIT_CHECKOUT)
  GIT_CHECKOUT := $(call unquote,$(GIT_CHECKOUT))

  pkgbuildtree = $(pkgtree)/source
  KERNELSRC = $(pkgbuildtree)
endif

ifeq ($(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_LOCAL),y)
  KERNELSRC := $(CONFIG_PACKAGE_KERNEL_LINUX_SOURCE_LOCAL_PATH)
  KERNELSRC := $(srctree)/$(call unquote,$(KERNELSRC))
endif

ifneq ($(wildcard $(local-src)),)
  KERNELSRC := $(local-src)
endif

KERNEL_CONFIG := $(CONFIG_PACKAGE_KERNEL_LINUX_CONFIG)
KERNEL_CONFIG := $(call unquote,$(KERNEL_CONFIG))

common-args = \
	--no-print-directory \
	-j $(NUM_CPU)

common-vars = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	KBUILD_OUTPUT='$(pkgtree)/build' \
	ARCH='$(ARCH)'

#
# setup build directory
#

$(pkgtree)/build:
	$(call cmd,mkdir_p)

$(pkgtree)/.setup: $(source) | $(pkgtree)/build
	$(call cmd,stamp)

#
# configure source tree
#

conf-args = $(common-args)
conf-vars = $(common-vars) \
	TOOLCHAIN_BASE_PATH=$(TOOLCHAIN_BASE_PATH) \
	check-lxdialog=$(srctree)/scripts/kconfig/lxdialog/check-lxdialog.sh

quiet_cmd_configure = CONFIG  $(KERNEL_CONFIG)
      cmd_configure = $(env) $(MAKE) -C $(KERNELSRC) $(conf-args) \
		      $(conf-vars) $(KERNEL_CONFIG)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,configure)
	$(call cmd,stamp)

PHONY += configure
configure:
	$(Q)$(env) TERM=$(TERM) $(MAKE) -C $(KERNELSRC) \
		$(conf-args) $(conf-vars) menuconfig

#
# extract version number from source
#

quiet_cmd_gen_kernel_release = GEN     $@
      cmd_gen_kernel_release = $(env) $(MAKE) -C $(KERNELSRC) $(conf-args) \
			       $(conf-vars) V=0 $(subst $(pkgtree)/build/,,$@)

$(pkgtree)/build/include/config/kernel.release: $(pkgtree)/.configure
	$(call cmd,gen_kernel_release)

PHONY += $(pkgtree)/build/include/config/kernel.release

quiet_cmd_gen_kernel_version = GEN     $@
      cmd_gen_kernel_version = \
	( sha1sum $< | sha1sum --check --status $@.hash 2> /dev/null ) || \
	( echo "VERSION = `cat $<`" > $@ && sha1sum $< > $@.hash )

$(pkgtree)/kernel-version: $(pkgtree)/build/include/config/kernel.release
	$(call cmd,gen_kernel_version)

ifneq ($(MAKECMDGOALS),clean)
  -include $(pkgtree)/kernel-version
endif

#
# build Linux kernel image, modules and optionally the FDT blob
#

build-args = $(common-args)
build-vars = $(common-vars)
build-targets = $(image) modules

ifeq ($(CONFIG_PACKAGE_KERNEL_LINUX_BUILD_DTBS),y)
  # FIXME: Not all kernels seem to support building the dtbs in one go with
  #        other targets because of a missing dependency on scripts (dtc).
  #        Uncomment the following line when they do, and remove the extra
  #        call into the Linux kernel build system below.
  #build-targets += dtbs

  quiet_cmd_build_dtbs = BUILD   dtbs
        cmd_build_dtbs = $(env) $(MAKE) -C $(KERNELSRC) $(build-args) \
			 $(build-vars) dtbs
endif

quiet_cmd_build_targets = BUILD   $(build-targets)
      cmd_build_targets = $(env) $(MAKE) -C $(KERNELSRC) $(build-args) \
			  $(build-vars) $(build-targets)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,build_targets)
	$(call cmd,build_dtbs)
	$(call cmd,stamp)

#
# install Linux kernel image, headers, modules and optionally the FDT blob
#

INSTALL_PATH = $(DESTDIR)/boot

quiet_cmd_install_path = MKDIR   $@
      cmd_install_path = test -d $@ && rm -rf $@; mkdir -p $@

PHONY += $(INSTALL_PATH)
$(INSTALL_PATH):
	$(call cmd,install_path)

install-args = $(common-args)
install-vars = \
	DEPMOD=$(BUILD_TOOLS)/bin/depmod \
	INSTALL_HDR_PATH=$(DESTDIR)$(prefix) \
	INSTALL_PATH=$(INSTALL_PATH) \
	INSTALL_MOD_PATH=$(DESTDIR) \
	INSTALLKERNEL=do-not-install \
	$(common-vars)

install-targets = \
	$(install-target) \
	headers_install

quiet_cmd_install_targets = INSTALL $(install-targets)
      cmd_install_targets = $(env) $(MAKE) -C $(KERNELSRC) $(install-args) $(install-vars) $(install-targets)

quiet_cmd_install_modules = INSTALL modules
      cmd_install_modules = $(env) $(MAKE) -C $(KERNELSRC) $(install-args) $(install-vars) modules_install

ifeq ($(ARCH),x86)
  IMAGE_NAME = vmlinuz
else
  ifeq ($(install-target),zinstall)
    IMAGE_NAME = vmlinuz-$(VERSION)
  else
    IMAGE_NAME = vmlinux-$(VERSION)
  endif
endif

quiet_cmd_install_symlink = SYMLINK $(objtree)/$(IMAGE_NAME)
      cmd_install_symlink = ln -sf $(INSTALL_PATH)/$(IMAGE_NAME) $(objtree)

ifneq ($(CONFIG_PACKAGE_KERNEL_LINUX_DTB),"")
  OLD_DTB_DIR := $(pkgtree)/build/arch/$(ARCH)/boot/
  NEW_DTB_DIR := $(pkgtree)/build/arch/$(ARCH)/boot/dts

  DTB_NAME := $(call unquote,$(CONFIG_PACKAGE_KERNEL_LINUX_DTB))
  DTB = $(or $(wildcard $(NEW_DTB_DIR)),$(OLD_DTB_DIR))/$(DTB_NAME).dtb

  quiet_cmd_install_fdt = SYMLINK $(objtree)/fdt.dtb
        cmd_install_fdt = ln -sf $(DTB) $(objtree)/fdt.dtb
endif

ifneq ($(wildcard $(srctree)/$(master-platform)/kernel.its.in),)
  quiet_cmd_gen_kernel_its = GEN     $(objtree)/kernel.its
        cmd_gen_kernel_its = m4 -P -DVERSION="$(VERSION)" $(srctree)/$(master-platform)/kernel.its.in > $(objtree)/kernel.its

  quiet_cmd_gen_uimage = MKIMAGE $(objtree)/uImage
        cmd_gen_uimage = cd $(objtree) && $(env) mkimage -f kernel.its uImage
endif

$(pkgtree)/.do-install: $(pkgtree)/.build | $(INSTALL_PATH)
	$(call cmd,install_targets)
	$(call cmd,install_modules)
	$(call cmd,install_symlink)
	$(call cmd,install_fdt)
	$(call cmd,gen_kernel_its)
	$(call cmd,gen_uimage)
	$(call cmd,stamp)

#
# cleanup and create installation tarballs
#

prunefiles = \
	$(prefix)/include/asm-generic/.install \
	$(prefix)/include/asm-generic/..install.cmd \
	$(prefix)/include/asm/.install \
	$(prefix)/include/asm/..install.cmd \
	$(prefix)/include/drm/.install \
	$(prefix)/include/drm/..install.cmd \
	$(prefix)/include/.install \
	$(prefix)/include/..install.cmd \
	$(prefix)/include/linux/byteorder/.install \
	$(prefix)/include/linux/byteorder/..install.cmd \
	$(prefix)/include/linux/caif/.install \
	$(prefix)/include/linux/caif/..install.cmd \
	$(prefix)/include/linux/can/.install \
	$(prefix)/include/linux/can/..install.cmd \
	$(prefix)/include/linux/dvb/.install \
	$(prefix)/include/linux/dvb/..install.cmd \
	$(prefix)/include/linux/hdlc/.install \
	$(prefix)/include/linux/hdlc/..install.cmd \
	$(prefix)/include/linux/hsi/.install \
	$(prefix)/include/linux/hsi/..install.cmd \
	$(prefix)/include/linux/.install \
	$(prefix)/include/linux/..install.cmd \
	$(prefix)/include/linux/isdn/.install \
	$(prefix)/include/linux/isdn/..install.cmd \
	$(prefix)/include/linux/mmc/.install \
	$(prefix)/include/linux/mmc/..install.cmd \
	$(prefix)/include/linux/modem_shm/.install \
	$(prefix)/include/linux/modem_shm/..install.cmd \
	$(prefix)/include/linux/netfilter_arp/.install \
	$(prefix)/include/linux/netfilter_arp/..install.cmd \
	$(prefix)/include/linux/netfilter_bridge/.install \
	$(prefix)/include/linux/netfilter_bridge/..install.cmd \
	$(prefix)/include/linux/netfilter/.install \
	$(prefix)/include/linux/netfilter/..install.cmd \
	$(prefix)/include/linux/netfilter/ipset/.install \
	$(prefix)/include/linux/netfilter/ipset/..install.cmd \
	$(prefix)/include/linux/netfilter_ipv4/.install \
	$(prefix)/include/linux/netfilter_ipv4/..install.cmd \
	$(prefix)/include/linux/netfilter_ipv6/.install \
	$(prefix)/include/linux/netfilter_ipv6/..install.cmd \
	$(prefix)/include/linux/nfsd/.install \
	$(prefix)/include/linux/nfsd/..install.cmd \
	$(prefix)/include/linux/raid/.install \
	$(prefix)/include/linux/raid/..install.cmd \
	$(prefix)/include/linux/spi/.install \
	$(prefix)/include/linux/spi/..install.cmd \
	$(prefix)/include/linux/sunrpc/.install \
	$(prefix)/include/linux/sunrpc/..install.cmd \
	$(prefix)/include/linux/tc_act/.install \
	$(prefix)/include/linux/tc_act/..install.cmd \
	$(prefix)/include/linux/tc_ematch/.install \
	$(prefix)/include/linux/tc_ematch/..install.cmd \
	$(prefix)/include/linux/usb/.install \
	$(prefix)/include/linux/usb/..install.cmd \
	$(prefix)/include/linux/wimax/.install \
	$(prefix)/include/linux/wimax/..install.cmd \
	$(prefix)/include/mtd/.install \
	$(prefix)/include/mtd/..install.cmd \
	$(prefix)/include/rdma/.install \
	$(prefix)/include/rdma/..install.cmd \
	$(prefix)/include/scsi/fc/.install \
	$(prefix)/include/scsi/fc/..install.cmd \
	$(prefix)/include/scsi/.install \
	$(prefix)/include/scsi/..install.cmd \
	$(prefix)/include/sound/.install \
	$(prefix)/include/sound/..install.cmd \
	$(prefix)/include/video/.install \
	$(prefix)/include/video/..install.cmd \
	$(prefix)/include/xen/.install \
	$(prefix)/include/xen/..install.cmd

include packages/cleanup.mk
include packages/binary.mk

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)
