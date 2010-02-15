PACKAGE = libxslt
VERSION = 1.1.24

LOCATION = ftp://xmlsoft.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--without-python \
	--without-crypto

prunefiles = \
	$(prefix)/lib/libexslt.la \
	$(prefix)/lib/libxslt.la

stripfiles = \
	$(prefix)/bin/xsltproc \
	$(prefix)/lib/libexslt.so.0.8.13 \
	$(prefix)/lib/libxslt.so.1.1.24
