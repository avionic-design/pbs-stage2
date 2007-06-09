PACKAGE = linux
VERSION = 2.6.21.3

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

conf-args = ARCH=$(ARCH)
package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) defconfig

build-args =
package-build:

install-args = \
	ARCH=$(ARCH) \
	INSTALL_HDR_PATH=$(PLATFORM)/usr

package-install:
	cd $(pkgtree) && $(MAKE) $(install-args) headers_install

