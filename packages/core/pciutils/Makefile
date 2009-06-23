PACKAGE = pciutils
VERSION = 3.1.0

LOCATION = http://www.kernel.org/pub/software/utils/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = Linux PCI Utilities

##############################################################################

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	PREFIX='$(prefix)'

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	PREFIX=$(prefix) \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.install:
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
