PACKAGE = gcc
VERSION = $(GCC_VERSION)

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2

##############################################################################

prefix = /core

include packages/buildroot/core/autotools.mk
include packages/buildroot/core/gcc/Makefile.$(VERSION)

package-clean:
	@:

