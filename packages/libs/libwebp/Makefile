PACKAGE = libwebp
VERSION = 0.2.1
LICENSE = custom

LOCATION = https://webp.googlecode.com/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
