PACKAGE = busybox
VERSION = 1.6.0

LOCATION = http://busybox.net/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

package-configure:
	cp packages/$(package)/$(PACKAGE_FULLNAME)-initrd $(pkgtree)/.config
	cd $(pkgtree) && $(MAKE) oldconfig V=1

package-build:
	cd $(pkgtree) && $(MAKE) V=1

package-install:
	cd $(pkgtree) && $(MAKE) PREFIX=$(PLATFORM)/rootfs -n install V=1

