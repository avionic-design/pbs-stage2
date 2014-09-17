PACKAGE = libee
VERSION = 0.4.1

LOCATION = http://www.libee.org/files/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk
NUM_CPU := 1

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
