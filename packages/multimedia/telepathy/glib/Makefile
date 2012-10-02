PACKAGE = telepathy-glib
VERSION = 0.19.10

LOCATION = http://telepathy.freedesktop.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
