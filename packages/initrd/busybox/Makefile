PACKAGE = busybox
VERSION = 1.6.0

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

#CROSS_COMPILE := $(CROSS_COMPILE)

conf-args =
package-configure:
	cp packages/$(package)/$(PACKAGE_FULLNAME)-initrd $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args =
package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

