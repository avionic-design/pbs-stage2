PACKAGE = u-boot
VERSION = 2016.11
LICENSE = GPL

LOCATION = ftp://ftp.denx.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/common.mk

u-boot-tools = \
	dumpimage \
	img2srec \
	mkenvimage \
	mkimage

u-boot-config-flags = \
	CONFIG_CMD_LOADS=y

ifeq ($(CONFIG_PACKAGE_BUILD_TOOLS_UBOOT_FIT),y)
  u-boot-config-flags += CONFIG_FIT=y

  ifeq ($(CONFIG_PACKAGE_BUILD_TOOLS_UBOOT_FIT_SIG),y)
    u-boot-config-flags += CONFIG_FIT_SIGNATURE=y
  endif
endif

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) allnoconfig
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(u-boot-config-flags) tools-only
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	install -m 755 -d $(prefix)/bin
	for tbin in $(u-boot-tools); do \
		install -m 755 $(pkgbuildtree)/tools/$${tbin} $(prefix)/bin; \
	done
	$(call cmd,stamp)
