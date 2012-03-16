PACKAGE = lzo
VERSION = 2.06
LICENSE = GPL

LOCATION = http://www.oberhumer.com/opensource/$(PACKAGE)/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-shared

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
