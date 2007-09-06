PACKAGE = libpng
VERSION = 1.2.18

LOCATION = ftp://ftp.simplesystems.org/pub/libpng/png/src
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-clean:
	@:

