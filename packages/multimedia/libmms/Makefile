PACKAGE = libmms
VERSION = 0.6.2

LOCATION = http://sourceforge.net/projects/$(PACKAGE)/files/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so
