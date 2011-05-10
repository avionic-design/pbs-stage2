PACKAGE = libdvbpsi
VERSION = 0.2.0

LOCATION = http://download.videolan.org/pub/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
