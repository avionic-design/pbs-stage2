PACKAGE = json-c
VERSION = 0.12
LICENSE = MIT

LOCATION = https://s3.amazonaws.com/json-c_releases/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
