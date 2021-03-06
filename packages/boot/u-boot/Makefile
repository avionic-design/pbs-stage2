PACKAGE = u-boot
VERSION = git
LICENSE = GPL

GIT_URL      = http://review.adnet.avionic-design.de/kernel/u-boot.git
GIT_CHECKOUT = $(CONFIG_U_BOOT_BRANCH)

ifneq ($(MAKECMDGOALS),watch)
  CONFIG_U_BOOT_BOARD:=$(call unquote,$(CONFIG_U_BOOT_BOARD))
  ifeq ($(CONFIG_U_BOOT_BOARD),)
    $(error CONFIG_U_BOOT_BOARD is not defined!)
  endif
endif

pkgbuildtree := $(pkgbuildtree)
include packages/common.mk
-include $(pkgtree)/version-file.mk
-include $(pkgtree)/version.mk

make-args = \
	O=$(pkgtree)/build \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	SYSROOT=$(SYSROOT) \
	-j $(NUM_CPU)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build && cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(make-args) $(CONFIG_U_BOOT_BOARD)_config
	$(call cmd,stamp)

$(pkgtree)/.build-%: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(make-args) $*
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.build-all \
                   $(if $(CONFIG_U_BOOT_NAND_SPL),$(pkgtree)/.build-nand_spl) \
                   $(if $(CONFIG_U_BOOT_MMC_SPL),$(pkgtree)/.build-mmc_spl)
	$(call cmd,stamp)

extrabin := \
	tools/$(ARCH)/mkimage \
	tools/imls/imls \
	tools/env/fw_printenv \

extralink := \
	tools/env/fw_setenv \


built-extrabin  = $(wildcard $(addprefix $(pkgtree)/build/,$(extrabin)))
built-extralink = $(wildcard $(addprefix $(pkgtree)/build/,$(extralink)))
built-extra     = $(built-extrabin) $(built-extralink)

$(pkgtree)/build/u-boot.bin: $(pkgtree)/.build-all
$(pkgtree)/build/nand_spl/u-boot-spl.bin: $(pkgtree)/.build-nand_spl
$(pkgtree)/build/mmc_spl/u-boot-spl.bin: $(pkgtree)/.build-mmc_spl

$(pkgtree)/.do-install-cleaned:
	@rm -f $(pkgtree)/install/boot/u-boot-*.bin
	$(call cmd,stamp)

$(pkgtree)/install/boot/u-boot-$(VERSION).bin: $(pkgtree)/build/u-boot.bin \
                                               $(pkgtree)/.do-install-cleaned
	$(call cmd,install)


$(pkgtree)/install/boot/u-boot-%-spl-$(VERSION).bin: $(pkgtree)/build/%_spl/u-boot-spl.bin \
                                                     $(pkgtree)/.do-install-cleaned
	$(call cmd,install)

quiet_cmd_install_extra = INSTALL $(notdir $(built-extra))
      cmd_install_extra = \
	mkdir -p $(pkgtree)/install/$(prefix)/bin ; \
	for bin in $(built-extrabin) ; do \
	    $(priv) install -m 755 -o root -g root $$bin $(pkgtree)/install/$(prefix)/bin/ ; \
	done ; \
	for bin in $(built-extralink) ; do \
	    $(priv) cp -d $$bin $(pkgtree)/install/$(prefix)/bin ; \
	done

$(pkgtree)/.do-install: $(pkgtree)/install/boot/u-boot-$(VERSION).bin \
                        $(if $(CONFIG_U_BOOT_NAND_SPL),$(pkgtree)/install/boot/u-boot-nand-spl-$(VERSION).bin) \
                        $(if $(CONFIG_U_BOOT_MMC_SPL),$(pkgtree)/install/boot/u-boot-mmc-spl-$(VERSION).bin)
	$(if $(built-extra),$(call cmd,install_extra))
	$(call cmd,stamp)

$(pkgbuildtree)/Makefile: $(pkgtree)/.patch

$(pkgtree)/version-file.mk: $(pkgbuildtree)/Makefile
	grep '^VERSION_FILE *=' $< | sed 's/$$(obj)//' > $@

$(pkgtree)/version.mk: $(pkgtree)/build/$(VERSION_FILE)
	grep U_BOOT_VERSION $< | sed 's,[^"]*"U-Boot \([^"]*\)",VERSION=\1,' > $@

$(pkgtree)/build/$(VERSION_FILE): $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(make-args) $@
	touch $@

include packages/cleanup.mk
include packages/binary.mk
