PACKAGE = libiconv
VERSION = 1.11

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/build-aux/ltmain.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/libcharset/build-aux/ltmain.sh

package-post-install:
	$(pkgtree)/obj-$(HOST)/libtool --finish $(ROOTFS)/usr/lib

package-clean:
	@:

