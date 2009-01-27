PACKAGE = pciutils
VERSION = 3.1.0

LOCATION = http://www.kernel.org/pub/software/utils/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = Linux PCI Utilities

##############################################################################

include packages/common.mk

package-configure:
	@:

build-args = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	PREFIX='$(prefix)'

package-build:
	cd $(pkgtree) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	PREFIX=$(prefix) \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

