PACKAGE = librsvg
VERSION = 2.34.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

loader = $(prefix)/lib/gdk-pixbuf-2.0/2.10.0/loaders
engine = $(prefix)/lib/gtk-2.0/2.10.0/engines

prunefiles = \
	$(loader)/*.a \
	$(loader)/*.la \
	$(engine)/*.a \
	$(engine)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/rsvg-convert \
	$(prefix)/bin/rsvg-view \
	$(loader)/*.so \
	$(engine)/*.so \
	$(prefix)/lib/*.so.*
