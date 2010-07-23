PACKAGE = gnome-menus
VERSION = 2.30.2

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.30
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-introspection \
	--disable-python

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
