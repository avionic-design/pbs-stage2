PACKAGE = u-boot
VERSION = git

GIT_URL      = git://git.adnet.avionic-design.de/kernel/u-boot-adx.git
GIT_CHECKOUT = $(CONFIG_U_BOOT_BRANCH)

ifeq ($(CONFIG_U_BOOT_BOARD),)
$(error CONFIG_U_BOOT_BOARD is not defined!)
endif

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build && cd $(pkgbuildtree) && \
		$(env) $(MAKE) O=../build $(CONFIG_U_BOOT_BOARD)_config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) O=../build CROSS_COMPILE=$(CROSS_COMPILE)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
