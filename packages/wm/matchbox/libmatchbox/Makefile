PACKAGE = libmatchbox
VERSION = 1.9

LOCATION = http://matchbox-project.org/sources/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-unit-tests

prunefiles = \
	$(prefix)/lib/libmb.la

stripfiles = \
	$(prefix)/lib/libmb.so.1.0.9
