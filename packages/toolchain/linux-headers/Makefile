PACKAGE = linux
VERSION = 2.6.21.3

LOCATION = http://www.kernel.org/pub/linux/kernel/v2.6
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

package-configure:

package-build:

package-install:
	mkdir -p $(PLATFORM)/usr/include
	cd $(pkgtree) && \
		cp -rf include/asm-generic $(PLATFORM)/usr/include && \
		cp -rf include/linux $(PLATFORM)/usr/include && \
		cp -rf include/asm-$(ARCH) $(PLATFORM)/usr/include/asm

