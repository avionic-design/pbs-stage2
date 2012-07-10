PACKAGE = nettle
VERSION = 2.5
LICENSE = GPL

LOCATION = http://www.lysator.liu.se/~nisse/archive
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-shared

stripfiles = \
	$(prefix)/bin/nettle-hash \
	$(prefix)/bin/nettle-lfib-stream \
	$(prefix)/bin/pkcs1-conv \
	$(prefix)/bin/sexp-conv
