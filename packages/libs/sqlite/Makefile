PACKAGE = sqlite-autoconf
VERSION = 3180000

LOCATION = http://ftp.osuosl.org/pub/blfs/conglomeration/sqlite/
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/*.so.*
