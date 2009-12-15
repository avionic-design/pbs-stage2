PACKAGE = freetype
VERSION = 2.3.11

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libfreetype.la

stripfiles = \
	$(prefix)/lib/libfreetype.so.6.3.22
