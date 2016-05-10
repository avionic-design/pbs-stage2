PACKAGE = libxkbcommon
VERSION = 0.6.1
LICENSE = MIT/X11

LOCATION = http://xkbcommon.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
