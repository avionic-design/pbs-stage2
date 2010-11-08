PACKAGE = libxml2
VERSION = 2.7.8

LOCATION = ftp://xmlsoft.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--without-python

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xmlcatalog \
	$(prefix)/bin/xmllint \
	$(prefix)/lib/*.so.*
