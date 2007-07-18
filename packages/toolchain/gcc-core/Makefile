PACKAGE = gcc
VERSION = $(GCC_VERSION)

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

patchdir = $(srctree)/packages/$(package)/$(VERSION)/patches/$(LIBC)/$(FLOAT)

include packages/toolchain/common.mk
include packages/toolchain/gcc-core/Makefile.$(VERSION)

