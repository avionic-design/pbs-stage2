PACKAGE = libgpg-error
VERSION = 1.7

LOCATION = ftp://ftp.gnupg.org/GnuPG/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libgpg-error.la

stripfiles = \
	$(prefix)/bin/gpg-error \
	$(prefix)/lib/libgpg-error.so.0.5.0
