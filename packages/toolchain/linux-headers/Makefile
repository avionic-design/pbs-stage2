PACKAGE = linux
VERSION = 2.6.21.3

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

package-configure:
	cd $(pkgtree) && $(MAKE) defconfig #> /dev/null

package-build:
#	cd $(pkgtree) && $(MAKE) CROSS_COMPILE=$(BOOTSTRAP_TOOLCHAIN) prepare #> /dev/null
	cd $(pkgtree) && $(MAKE) ARCH=$(ARCH) include/asm include/linux/version.h include/asm-$(ARCH)/.arch

package-install:
#	cd $(pkgtree) && $(MAKE) INSTALL_HDR_PATH=$(PLATFORM)/usr headers_install #> /dev/null
	mkdir -p $(PLATFORM)/usr/include
	cd $(pkgtree) && \
		cp -rf include/asm-generic $(PLATFORM)/usr/include/asm-generic && \
		cp -rf include/linux $(PLATFORM)/usr/include && \
		cp -rf include/asm-$(ARCH) $(PLATFORM)/usr/include/asm

