PACKAGE = curl
VERSION = 7.39.0
LICENSE = MIT/X derivate

LOCATION = http://$(PACKAGE).haxx.se/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-random=/dev/urandom

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/curl \
	$(prefix)/lib/*.so.*
