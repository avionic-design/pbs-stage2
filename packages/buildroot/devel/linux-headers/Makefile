PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/devel/common.mk
ARCH := $(shell echo $(ARCH) | sed s/i.86/i386/)

conf-args := ARCH=$(ARCH)
package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) mrproper

build-args := ARCH=$(ARCH)
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) headers_check

install-args := \
	INSTALL_HDR_PATH=$(ROOTFS)$(prefix) \
	ARCH=$(ARCH)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) headers_install

package-clean:
	@:

