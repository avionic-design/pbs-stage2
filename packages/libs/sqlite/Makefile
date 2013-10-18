PACKAGE = sqlite-autoconf
VERSION = 3080100

LOCATION = http://www.sqlite.org/2013
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/*.so.*
