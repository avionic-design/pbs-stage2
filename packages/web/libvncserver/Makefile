PACKAGE = LibVNCServer
VERSION = 0.9.11
LICENSE = GPL

LOCATION = https://github.com/LibVNC/libvncserver/archive
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/libvncserver-$(PACKAGE)-$(VERSION)

include packages/autotools.mk

prunefiles = \
	$(prefix)/bin/libvncserver-config \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linuxvnc \
	$(prefix)/lib/*.so.*
