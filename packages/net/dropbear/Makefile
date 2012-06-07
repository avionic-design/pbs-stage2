PACKAGE = dropbear
VERSION = 0.52
LICENSE = MIT

LOCATION = http://matt.ucc.asn.au/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/dbclient \
	$(prefix)/bin/dropbearconvert \
	$(prefix)/bin/dropbearkey \
	$(prefix)/sbin/dropbear
