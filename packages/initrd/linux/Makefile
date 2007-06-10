PACKAGE = linux
VERSION = 2.6.21.3

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args = ARCH=$(ARCH)
package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) prepare

install-args =
package-install:
	cd $(pkgtree) && ln -sf $(notdir $(pkgtree)) ../linux

