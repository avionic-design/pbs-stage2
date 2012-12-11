PACKAGE = glu
VERSION = 9.0.0
LICENSE = LPGL

LOCATION = ftp://ftp.freedesktop.org/pub/mesa/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
