PACKAGE = bzip2
VERSION = 1.0.4

LOCATION = http://bzip.org/$(VERSION)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/buildroot/devel/common.mk

package-configure:
	@:

build-vars += \
	$(call set-args, $(CROSS_TOOLS));

package-build:
	cd $(pkgtree) && $(MAKE) $(build-vars)

install-vars += \
	PREFIX=$(ROOTFS)$(prefix)

package-install:
	cd $(pkgtree) && $(MAKE) install -n $(install-vars)

package-clean:
	@:

