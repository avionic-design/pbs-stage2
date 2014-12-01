PACKAGE = libmatchbox
VERSION = 1.9

LOCATION = http://downloads.yoctoproject.org/releases/matchbox/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-unit-tests

prunefiles = \
	$(prefix)/lib/libmb.la

stripfiles = \
	$(prefix)/lib/libmb.so.1.0.9
