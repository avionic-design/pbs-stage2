PACKAGE = libogg
VERSION = 1.2.1

LOCATION = http://downloads.xiph.org/releases/ogg
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
