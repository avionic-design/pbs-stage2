PACKAGE = libxkbcommon
VERSION = 0.2.0
LICENSE = MIT/X11

LOCATION = http://xkbcommon.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
