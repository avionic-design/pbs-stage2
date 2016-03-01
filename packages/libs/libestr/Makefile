PACKAGE = libestr
VERSION = 0.1.10
LICENSE = LGPL

LOCATION = http://libestr.adiscon.com/files/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
