ifndef LINUX_VERSION
  $(error LINUX_VERSION undefined)
endif

PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args :=
package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig

build-args :=
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) prepare

install-args := \
	INSTALL_HDR_PATH=$(ROOTFS)/tools

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) headers_install

