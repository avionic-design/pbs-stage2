PACKAGE = xcb-util-wm
VERSION = 0.4.1

LOCATION = http://xcb.freedesktop.org/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
