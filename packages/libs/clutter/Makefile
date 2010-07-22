PACKAGE = clutter
VERSION = 1.3.8

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/1.3
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
