PACKAGE = libffi
VERSION = 3.0.11
LICENSE = MIT

LOCATION = ftp://sourceware.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
