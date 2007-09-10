PACKAGE = libpng
VERSION = 1.2.19

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-clean:
	@:

