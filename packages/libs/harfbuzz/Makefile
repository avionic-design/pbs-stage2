PACKAGE = harfbuzz
VERSION = 1.4.6
LICENSE = MIT

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/hb-ot-shape-closure \
	$(prefix)/bin/hb-shape \
	$(prefix)/bin/hb-view \
	$(prefix)/lib/*.so.*
