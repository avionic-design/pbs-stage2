PACKAGE = fribidi
VERSION = 0.19.2

LOCATION = http://fribidi.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libfribidi.la

stripfiles = \
	$(prefix)/bin/fribidi \
	$(prefix)/lib/libfribidi.so.0.3.1
