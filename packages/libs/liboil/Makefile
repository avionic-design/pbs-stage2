PACKAGE = liboil
VERSION = 0.3.17

LOCATION = http://$(PACKAGE).freedesktop.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/oil-bugreport \
	$(prefix)/lib/*.so.*
