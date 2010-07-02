PACKAGE = metacity
VERSION = 2.30.1

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.30
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/metacity \
	$(prefix)/bin/metacity-message \
	$(prefix)/bin/metacity-theme-viewer \
	$(prefix)/bin/metacity-window-demo \
	$(prefix)/lib/*.so.*
