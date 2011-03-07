PACKAGE = linux-2.6.git
VERSION = git

include $(objtree)/include/config/auto.conf
-include $(pkgtree)/kernel-release

KERNELSRC := $(or $(wildcard $(srctree)/$(obj)/src),"$(srctree)/$(call unquote,$(CONFIG_KERNEL_SOURCE))")
ARCH := $(call unquote,$(CONFIG_ARCH))
export KERNELSRC ARCH

KERNEL_CONFIG = $(CONFIG_KERNEL_CONFIG)
DESTDIR = $(pkgtree)/install
export KERNEL_CONFIG DESTDIR

MAKEFLAGS =
KBUILD_SRC =
KBUILD_OUTPUT =
unexport MAKEFLAGS KBUILD_SRC KBUILD_OUTPUT

include $(srctree)/packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build build
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build headers-install
	$(Q)$(MAKE) $(kernel)=$(pkgtree)/build install
	$(if $(wildcard $(pkgtree)/build/arch/$(ARCH)/boot/uImage),$(call cmd,install_uimage))
	$(call cmd,stamp)

quiet_cmd_install_uimage = INSTALL boot/uImage
      cmd_install_uimage = install $(pkgtree)/build/arch/$(ARCH)/boot/uImage \
				$(pkgtree)/install/boot/uImage-$$(cat $(pkgtree)/kernel-version)

prunefiles = \
	$(prefix)/include/asm-generic/.install \
	$(prefix)/include/asm/.install \
	$(prefix)/include/drm/.install \
	$(prefix)/include/.install \
	$(prefix)/include/linux/byteorder/.install \
	$(prefix)/include/linux/can/.install \
	$(prefix)/include/linux/dvb/.install \
	$(prefix)/include/linux/hdlc/.install \
	$(prefix)/include/linux/.install \
	$(prefix)/include/linux/isdn/.install \
	$(prefix)/include/linux/netfilter_arp/.install \
	$(prefix)/include/linux/netfilter_bridge/.install \
	$(prefix)/include/linux/netfilter/.install \
	$(prefix)/include/linux/netfilter_ipv4/.install \
	$(prefix)/include/linux/netfilter_ipv6/.install \
	$(prefix)/include/linux/nfsd/.install \
	$(prefix)/include/linux/raid/.install \
	$(prefix)/include/linux/spi/.install \
	$(prefix)/include/linux/sunrpc/.install \
	$(prefix)/include/linux/tc_act/.install \
	$(prefix)/include/linux/tc_ematch/.install \
	$(prefix)/include/linux/usb/.install \
	$(prefix)/include/linux/wimax/.install \
	$(prefix)/include/mtd/.install \
	$(prefix)/include/rdma/.install \
	$(prefix)/include/scsi/fc/.install \
	$(prefix)/include/scsi/.install \
	$(prefix)/include/sound/.install \
	$(prefix)/include/video/.install \
	$(prefix)/include/xen/.install

include $(srctree)/packages/cleanup.mk
include $(srctree)/packages/binary.mk

$(objtree)/dist/$(obj)/src.local: SRC_DIR=$(KERNELSRC)
extra-dist-deps := $(objtree)/dist/$(obj)/src.local
