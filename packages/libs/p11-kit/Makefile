PACKAGE = p11-kit
VERSION = 0.10

LOCATION = http://p11-glue.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/p11-kit \
	$(prefix)/lib/*.so.*
