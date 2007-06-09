PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2
PATCHES  = xscale-flags.patch

include packages/toolchain/common.mk

conf-args = \
	CROSS_COMPILE=$(PLATFORM)/usr/bin/$(HOST)- \
	MAKEFLAGS=

package-configure:
	cp conf/$(PACKAGE_FULLNAME).config $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(PLATFORM)/usr/bin/$(HOST)- \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(PLATFORM)/usr/bin/$(HOST)- \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

