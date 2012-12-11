PACKAGE = evemu
VERSION = 1.0.10
LICENSE = LGPL

LOCATION = https://launchpad.net/evemu/trunk/$(PACKAGE)-$(VERSION)/+download
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/evemu-describe \
	$(prefix)/bin/evemu-device \
	$(prefix)/bin/evemu-event \
	$(prefix)/bin/evemu-play \
	$(prefix)/bin/evemu-record \
	$(prefix)/lib/*.so.*
