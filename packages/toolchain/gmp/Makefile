PACKAGE = gmp
VERSION = 4.2.4

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = multiprecision arithmetic library

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--prefix=$(prefix)

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

