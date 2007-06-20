PACKAGE = net-tools
VERSION = 1.60

LOCATION  = http://www.tazenda.demon.co.uk/phil/$(PACKAGE)
TARBALLS  = $(PACKAGE_FULLNAME).tar.bz2
DOTCONFIG = packages/$(package)/$(PACKAGE_FULLNAME)

include packages/common.mk

env = env -i $(call set-args, CC)

package-configure:
	cp $(DOTCONFIG) $(pkgtree)/config.status
	cd $(pkgtree) && yes '' | $(env) $(MAKE) $(conf-args) config

build-args = \
	COPTS='$(CFLAGS)' \
	LOPTS='$(CFLAGS) $(LDFLAGS)'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	BASEDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

