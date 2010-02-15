PACKAGE = libfakekey
VERSION = 0.1

LOCATION = http://matchbox-project.org/sources/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libfakekey.la

stripfiles = \
	$(prefix)/lib/libfakekey.so.0.0.1
