PACKAGE = libwebp
VERSION = 0.4.0
LICENSE = custom

LOCATION = https://storage.googleapis.com/downloads.webmproject.org/releases/webp
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
