PACKAGE = libosip2
VERSION = 4.0.0
LICENSE = LGPL

LOCATION = http://download.savannah.gnu.org/releases/osip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
