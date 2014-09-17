PACKAGE = json-c
VERSION = 0.9
LICENSE = MIT

LOCATION = http://oss.metaparadigm.com/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
