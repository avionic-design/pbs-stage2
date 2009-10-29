PACKAGE = libxml2
VERSION = 2.7.6

LOCATION = ftp://xmlsoft.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--without-python

prunefiles = \
	$(prefix)/lib/libxml2.la

stripfiles = \
	$(prefix)/bin/xmlcatalog \
	$(prefix)/bin/xmllint \
	$(prefix)/lib/libxml2.so.$(VERSION)
