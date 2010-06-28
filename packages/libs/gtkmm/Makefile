PACKAGE = gtkmm
VERSION = 2.21.1

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/gtkmm/2.21
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libgdkmm-2.4.la \
	$(prefix)/lib/libgtkmm-2.4.la

sover = 1.1.0

stripfiles = \
	$(prefix)/lib/libgdkmm-2.4.so.$(sover) \
	$(prefix)/lib/libgtkmm-2.4.so.$(sover)
