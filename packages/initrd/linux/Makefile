ifndef LINUX_VERSION
  $(error LINUX_VERSION undefined)
endif

PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = Linux kernel

##############################################################################

include packages/common.mk

conf-args = \
	ARCH=$(ARCH)

package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig

build-args = \
	ARCH=$(ARCH)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) prepare

install-args =
package-install:
	cd $(pkgtree) && ln -sf $(notdir $(pkgtree)) ../linux

