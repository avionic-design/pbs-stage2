PACKAGE = libfakekey
VERSION = 0.1

LOCATION = http://downloads.yoctoproject.org/releases/matchbox/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libfakekey.la

stripfiles = \
	$(prefix)/lib/libfakekey.so.0.0.1
