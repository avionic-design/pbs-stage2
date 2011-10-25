PACKAGE = libxslt
VERSION = 1.1.26

LOCATION = ftp://xmlsoft.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--without-crypto \
	--without-python

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xsltproc \
	$(prefix)/lib/*.so.*
