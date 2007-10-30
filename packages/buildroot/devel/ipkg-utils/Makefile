PACKAGE = ipkg-utils
VERSION = 1.7

LOCATION = ftp://ftp.handhelds.org/packages/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/buildroot/devel/common.mk

package-configure:
	@:

build-vars += \
	$(call set-args, CC CFLAGS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-vars)

install-vars += \
	DESTDIR=$(ROOTFS) \
	PREFIX=$(prefix)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-vars) install

package-clean:
	@:

