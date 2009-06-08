PACKAGE = mpfr
VERSION = 2.4.1

LOCATION = http://www.mpfr.org/mpfr-current
TARBALLS = $(PACKAGE)-$(VERSION).tar.lzma

DESCRIPTION = multiple precision floating-point computation

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--prefix=$(prefix) \
	--with-gmp=$(ROOTFS)$(prefix)

conf-vars =

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args =

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifneq ($(ROOTFS),)
  install-args = \
	DESTDIR=$(ROOTFS)
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
