PACKAGE = libsigc++
VERSION = 2.2.8

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/2.2
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libsigc-2.0.la

stripfiles = \
	$(prefix)/lib/libsigc-2.0.so.0.0.0
