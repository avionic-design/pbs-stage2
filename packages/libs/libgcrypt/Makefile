PACKAGE = libgcrypt
VERSION = 1.5.0

LOCATION = ftp://ftp.gnupg.org/gcrypt/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-asm

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dumpsexp \
	$(prefix)/bin/hmac256 \
	$(prefix)/lib/*.so.*
