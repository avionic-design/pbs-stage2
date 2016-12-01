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

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) defconfig && \
		$(env) $(MAKE) silentoldconfig
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) tools-only
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	install -m 755 -d $(prefix)/bin
	for tbin in $(u-boot-tools); do \
		install -m 755 $(pkgbuildtree)/tools/$${tbin} $(prefix)/bin; \
	done
	$(call cmd,stamp)
