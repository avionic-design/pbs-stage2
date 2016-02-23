PACKAGE = libevdev
VERSION = 1.3
LICENSE = X11

LOCATION = http://www.freedesktop.org/software/libevdev
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/touchpad-edge-detector \
	$(prefix)/lib/*.so.*
