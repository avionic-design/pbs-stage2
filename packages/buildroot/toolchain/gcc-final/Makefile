PACKAGE = gcc
VERSION = $(GCC_VERSION)

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2

##############################################################################

include packages/buildroot/toolchain/autotools.mk
include packages/buildroot/toolchain/gcc-final/Makefile.$(VERSION)

package-clean:
	@:

