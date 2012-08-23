PACKAGE = librsvg
VERSION = 2.36.3
LICENSE = GPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-introspection

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
	$(prefix)/bin/rsvg-view-3 \
	$(loader)/*.so \
	$(engine)/*.so \
	$(prefix)/lib/*.so.*
