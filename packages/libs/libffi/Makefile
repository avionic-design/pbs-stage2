PACKAGE = libffi
VERSION = 3.0.9

LOCATION = ftp://sourceware.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libffi.la

stripfiles = \
	$(prefix)/lib/libffi.so.5.0.10
