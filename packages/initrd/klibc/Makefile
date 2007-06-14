PACKAGE = klibc
VERSION = 1.5

LOCATION = http://www.kernel.org/pub/linux/libs/klibc
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

# use a sane environment
env = env -i PATH=/usr/bin:/bin

conf-args =
package-configure:
	cd $(pkgtree) && ln -sf ../../linux/linux

build-args = \
	KLIBCARCH=$(ARCH) \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	V=1

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) all

install-args = \
	KLIBCARCH=$(ARCH) \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	INSTALLROOT=$(ROOTFS) \
	INSTALLDIR=/initrd \
	V=1

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
	cd $(ROOTFS)/initrd/bin && ln -sf sh.shared sh

