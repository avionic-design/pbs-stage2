PACKAGE = libpng
VERSION = 1.4.0

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libpng.la \
	$(prefix)/lib/libpng14.la

stripfiles = \
	$(prefix)/lib/libpng14.so.14.0.0
