PACKAGE = libvorbis
VERSION = 1.3.3

LOCATION = http://downloads.xiph.org/releases/vorbis
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
