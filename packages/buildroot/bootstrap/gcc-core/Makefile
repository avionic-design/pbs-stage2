PACKAGE = gcc
VERSION = $(GCC_VERSION)

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2

##############################################################################

prefix = /bootstrap
include packages/buildroot/bootstrap/common.mk
include packages/buildroot/bootstrap/gcc-core/Makefile.$(VERSION)

package-clean:
	@:

