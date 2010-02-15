PACKAGE = sqlite
VERSION = 3.6.16

LOCATION = http://www.sqlite.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libsqlite3.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/libsqlite3.so.0.8.6
