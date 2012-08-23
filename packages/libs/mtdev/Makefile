PACKAGE = mtdev
VERSION = 1.1.3
LICENSE = MIT

LOCATION = http://bitmath.org/code/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/mtdev-test \
	$(prefix)/lib/*.so.*
