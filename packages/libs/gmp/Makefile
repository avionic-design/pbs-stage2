PACKAGE = gmp
VERSION = 6.1.2
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
