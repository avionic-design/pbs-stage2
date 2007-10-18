PACKAGE = busybox
VERSION = 1.7.2

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = tiny utilities for small and embedded systems

##############################################################################

include packages/common.mk

conf-args = \
	$(call set-args, CROSS_COMPILE)

package-configure:
	cp packages/$(package)/$(PACKAGE_FULLNAME)-initrd $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	$(call set-args, CROSS_COMPILE)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	$(call set-args, CROSS_COMPILE ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

package-clean:
	@:

