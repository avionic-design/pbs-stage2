PACKAGE = libestr
VERSION = 0.1.9
LICENSE = LGPL

LOCATION = http://libestr.adiscon.com/files/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
