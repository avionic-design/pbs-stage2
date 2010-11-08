PACKAGE = libgpg-error
VERSION = 1.10

LOCATION = ftp://ftp.gnupg.org/GnuPG/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gpg-error \
	$(prefix)/lib/*.so.*
