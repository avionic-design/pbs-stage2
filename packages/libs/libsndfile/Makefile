PACKAGE = libsndfile
VERSION = 1.0.24
LICENSE = LGPL

LOCATION = http://www.mega-nerd.com/$(PACKAGE)/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sndfile-cmp \
	$(prefix)/bin/sndfile-concat \
	$(prefix)/bin/sndfile-convert \
	$(prefix)/bin/sndfile-deinterleave \
	$(prefix)/bin/sndfile-info \
	$(prefix)/bin/sndfile-interleave \
	$(prefix)/bin/sndfile-metadata-get \
	$(prefix)/bin/sndfile-metadata-set \
	$(prefix)/bin/sndfile-play \
	$(prefix)/bin/sndfile-regtest \
	$(prefix)/bin/sndfile-salvage \
	$(prefix)/lib/*.so.*
