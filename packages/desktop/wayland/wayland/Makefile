PACKAGE = wayland
VERSION = 1.0.2
LICENSE = custom

LOCATION = http://wayland.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/wayland-scanner \
	$(prefix)/lib/*.so.*
