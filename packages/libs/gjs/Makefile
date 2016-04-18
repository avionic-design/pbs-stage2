PACKAGE = gjs
VERSION = 0.7.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/gjs-1.0

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/gjs-console \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
