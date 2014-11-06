PACKAGE = json-c
VERSION = 0.9
LICENSE = MIT

LOCATION = https://s3.amazonaws.com/json-c_releases/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
