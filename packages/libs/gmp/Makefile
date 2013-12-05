PACKAGE = gmp
VERSION = 5.1.1
LICENSE = LGPL

LOCATION = ftp://ftp.gmplib.org/pub/$(PACKAGE)-$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
