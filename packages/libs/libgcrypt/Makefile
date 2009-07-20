PACKAGE = libgcrypt
VERSION = 1.4.4

LOCATION = ftp://ftp.gnupg.org/gcrypt/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libgcrypt.la

stripfiles = \
	$(prefix)/bin/dumpsexp \
	$(prefix)/bin/hmac256 \
	$(prefix)/lib/libgcrypt.so.11.5.2
