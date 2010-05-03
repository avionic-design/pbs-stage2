PACKAGE = libogg
VERSION = 1.2.0

LOCATION = http://downloads.xiph.org/releases/ogg
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libogg.la

stripfiles = \
	$(prefix)/lib/libogg.so.0.7.0
