PACKAGE = sqlite-autoconf
VERSION = 3150200

LOCATION = http://ftp.osuosl.org/pub/blfs/conglomeration/sqlite/
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/*.so.*
