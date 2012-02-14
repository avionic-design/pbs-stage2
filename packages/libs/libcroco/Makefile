PACKAGE = libcroco
VERSION = 0.6.4

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/bin/croco-$(MAJOR).$(MINOR)-config \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/csslint-$(MAJOR).$(MINOR) \
	$(prefix)/lib/*.so.*
