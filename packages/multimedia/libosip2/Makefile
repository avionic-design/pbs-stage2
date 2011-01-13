PACKAGE = libosip2
VERSION = 3.5.0

LOCATION = http://download.savannah.gnu.org/releases/osip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
