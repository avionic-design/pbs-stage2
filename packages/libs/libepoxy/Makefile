PACKAGE = libepoxy
VERSION = 1.4
LICENSE = MIT

LOCATION = https://github.com/anholt/libepoxy/archive/
TARBALLS = v$(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
