PACKAGE = libvorbis
VERSION = 1.3.2

LOCATION = http://downloads.xiph.org/releases/vorbis
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
