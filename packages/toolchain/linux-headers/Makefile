ifndef LINUX_VERSION
  $(error LINUX_VERSION undefined)
endif

PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

LINUX_DOT_CONFIG = conf/linux-$(LINUX_VERSION)-$(CPU)

include packages/toolchain/common.mk

conf-args = \
	ARCH=$(ARCH)

package-configure:
ifneq ($(wildcard $(LINUX_DOT_CONFIG)),)
	cp $(LINUX_DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig
else
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig
endif

build-args =
package-build:

install-args = \
	ARCH=$(ARCH) \
	INSTALL_HDR_PATH=$(PLATFORM)/usr

package-install:
	cd $(pkgtree) && $(MAKE) $(install-args) headers_install

