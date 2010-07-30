ifndef LINUX_VERSION
  $(error LINUX_VERSION undefined)
endif

PACKAGE = linux
VERSION = $(LINUX_VERSION)

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

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
	INSTALL_PATH=$(PLATFORM) \
	INSTALL_HDR_PATH=$(DESTDIR)/usr \
	INSTALL_MOD_PATH=$(DESTDIR)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) headers_install
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) zinstall
	# for some reason the linkage.h headers won't be installed in the
	# previous step
	cp $(pkgtree)/include/asm/linkage.h $(DESTDIR)/usr/include/asm
	cp $(pkgtree)/include/linux/linkage.h $(DESTDIR)/usr/include/linux

