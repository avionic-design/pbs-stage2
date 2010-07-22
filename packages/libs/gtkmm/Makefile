PACKAGE = gtkmm
VERSION = 2.21.5

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/gtkmm/2.21
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
