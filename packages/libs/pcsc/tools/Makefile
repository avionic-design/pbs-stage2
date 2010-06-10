PACKAGE = pcsc-tools
VERSION = 1.4.16

LOCATION = http://ludovic.rousseau.free.fr/softwares/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/pcsc_scan

include packages/cleanup.mk
include packages/binary.mk
