PACKAGE = libtasn1
VERSION = 4.7
LICENSE = LGPL

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/asn1Coding \
	$(prefix)/bin/asn1Decoding \
	$(prefix)/bin/asn1Parser \
	$(prefix)/lib/*.so.*
