PACKAGE = popt
VERSION = 1.16
LICENSE = custom

LOCATION = http://rpm5.org/files/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
