PACKAGE = klibc
VERSION = 1.5

LOCATION = http://www.kernel.org/pub/linux/libs/klibc
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args =
package-configure:
	cd $(pkgtree) && ln -sf ../../linux/linux ../linux

build-args = \
	KLIBCARCH=$(ARCH)

package-build:
	cd $(pkgtree) && $(env) $(MAKE)

package-install:

