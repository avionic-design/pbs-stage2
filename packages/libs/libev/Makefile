PACKAGE = libev
VERSION = 4.03

LOCATION = http://dist.schmorp.de/$(PACKAGE)/Attic
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
