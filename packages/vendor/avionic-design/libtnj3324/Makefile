PACKAGE = libtnj3324
VERSION = 0.1.0
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-tnj3324test

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/usr/bin/tnj3324test \
	$(prefix)/lib/*.so.*
