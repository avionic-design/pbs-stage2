ifndef LINUX_VERSION
  $(error LINUX_VERSION undefined)
endif

PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = Linux kernel headers

##############################################################################

include packages/common.mk

conf-args = \
	ARCH=$(ARCH)

package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig

build-args = \
	ARCH=$(ARCH) \
	CROSS_COMPILE=$(CROSS_COMPILE)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) prepare

install-args = \
	ARCH=$(ARCH) \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	INSTALL_HDR_PATH=$(ROOTFS)/usr

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) headers_install

