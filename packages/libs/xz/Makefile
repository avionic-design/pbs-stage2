PACKAGE = xz
VERSION = 5.0.3

LOCATION = http://tukaani.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/lzmadec \
	$(prefix)/bin/lzmainfo \
	$(prefix)/bin/xz \
	$(prefix)/bin/xzdec \
	$(prefix)/lib/*.so.*
