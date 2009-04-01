PACKAGE = mpfr
VERSION = 2.4.1

LOCATION = http://www.mpfr.org/mpfr-current
TARBALLS = $(PACKAGE_FULLNAME).tar.lzma

DESCRIPTION = multiple precision floating-point computation

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--prefix=$(prefix) \
	--with-gmp=$(ROOTFS)$(prefix)

conf-vars =

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

ifneq ($(ROOTFS),)
  install-args = \
	DESTDIR=$(ROOTFS)
endif

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

