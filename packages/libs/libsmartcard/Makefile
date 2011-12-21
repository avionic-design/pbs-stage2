PACKAGE = libsmartcard
VERSION = 0.1.2

LOCATION = http://ftp.avionic-design.de/pub/libsmartcard
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/smartcard-tool \
	$(prefix)/lib/*.so.*
