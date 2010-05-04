PACKAGE = libglade
VERSION = 2.6.4

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/2.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libglade-2.0.la

stripfiles = \
	$(prefix)/lib/libglade-2.0.so.0.0.7
