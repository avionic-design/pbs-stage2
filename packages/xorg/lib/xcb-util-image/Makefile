PACKAGE = xcb-util-image
VERSION = 0.3.8

LOCATION = http://xcb.freedesktop.org/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
