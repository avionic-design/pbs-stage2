PACKAGE = liboil
VERSION = 0.3.16

LOCATION = http://$(PACKAGE).freedesktop.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/liboil-0.3.la

stripfiles = \
	$(prefix)/bin/oil-bugreport \
	$(prefix)/lib/liboil-0.3.so.0.3.0
