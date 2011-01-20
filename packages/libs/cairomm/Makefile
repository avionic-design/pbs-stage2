PACKAGE = cairomm
VERSION = 1.9.8

LOCATION = http://cairographics.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
