PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk

DEF_CONFIG = conf/$(PACKAGE_FULLNAME).config
CPU_CONFIG = conf/$(PACKAGE_FULLNAME)-$(CPU).config
DOT_CONFIG = $(if $(wildcard $(CPU_CONFIG)),$(CPU_CONFIG),$(DEF_CONFIG))

conf-args = \
	CROSS_COMPILE=$(prefix)/bin/$(HOST)- \
	MAKEFLAGS= \
	V=1

package-configure:
	cp $(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(prefix)/bin/$(HOST)- \
	PREFIX=$(prefix)/ \
	RUNTIME_PREFIX=$(HOST)/ \
	DEVEL_PREFIX=$(HOST)/ \
	V=1

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(prefix)/bin/$(HOST)- \
	PREFIX=$(prefix)/ \
	RUNTIME_PREFIX=$(HOST)/ \
	DEVEL_PREFIX=$(HOST)/ \
	V=1

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

package-clean:
	@:

