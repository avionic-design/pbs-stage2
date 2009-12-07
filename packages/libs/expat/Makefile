PACKAGE = expat
VERSION = 2.0.1

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libexpat.la

stripfiles = \
	$(prefix)/bin/xmlwf \
	$(prefix)/lib/libexpat.so.1.5.2
