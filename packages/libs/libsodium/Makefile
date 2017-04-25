PACKAGE = libsodium
VERSION = 1.0.12
LICENSE = ISC

LOCATION = https://download.libsodium.org/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
