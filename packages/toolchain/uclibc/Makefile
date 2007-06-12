PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

PATH := $(CORE_PREFIX)/bin:$(PATH)

conf-args = \
	CROSS_COMPILE=$(HOST)- \
	MAKEFLAGS=

package-configure:
ifneq ($(wildcard conf/$(PACKAGE_FULLNAME)-$(CPU).config),)
	cp conf/$(PACKAGE_FULLNAME)-$(CPU).config $(pkgtree)/.config
else
	cp conf/$(PACKAGE_FULLNAME).config $(pkgtree).config
endif
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(HOST)- \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(HOST)- \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

