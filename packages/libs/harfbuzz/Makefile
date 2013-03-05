PACKAGE = harfbuzz
VERSION = 0.9.13
LICENSE = MIT

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-vars += \
	CXXFLAGS='$(CPPFLAGS)'

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/hb-ot-shape-closure \
	$(prefix)/bin/hb-shape \
	$(prefix)/bin/hb-view \
	$(prefix)/lib/*.so.*
