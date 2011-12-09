PACKAGE = libcec
VERSION = git

LOCATION = http://$(PACKAGE).freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

#conf-args 

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/cec-client \
	$(prefix)/lib/*.so.*
