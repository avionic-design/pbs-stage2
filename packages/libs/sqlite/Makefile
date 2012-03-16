PACKAGE = sqlite-autoconf
VERSION = 3071000

LOCATION = http://www.sqlite.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/*.so.*
