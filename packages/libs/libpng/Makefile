PACKAGE = libpng
VERSION = 1.2.41

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libpng.la \
	$(prefix)/lib/libpng12.la

stripfiles = \
	$(prefix)/lib/libpng.so.3.41.0 \
	$(prefix)/lib/libpng12.so.0.41.0
