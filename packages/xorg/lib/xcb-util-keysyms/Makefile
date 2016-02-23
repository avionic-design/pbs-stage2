PACKAGE = xcb-util-keysyms
VERSION = 0.4.0

LOCATION = http://xcb.freedesktop.org/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
