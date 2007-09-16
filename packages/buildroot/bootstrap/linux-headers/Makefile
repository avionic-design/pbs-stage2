PACKAGE = linux
VERSION = 2.6.22.6

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/bootstrap/common.mk

conf-args :=
package-configure:
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) mrproper

build-args :=
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) headers_check

install-args := \
	INSTALL_HDR_PATH=$(ROOTFS)/tools

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) headers_install

package-clean:
	@:

