PACKAGE = pango
VERSION = 1.28.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

# pango configure does not detect the C++ cross-compiler correctly
conf-vars += \
	CXX=$(TARGET)-g++

plugin = $(prefix)/lib/pango/1.6.0/modules

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
