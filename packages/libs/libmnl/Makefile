PACKAGE = libmnl
VERSION = 1.0.4
LICENSE = LGPLv2.1+

LOCATION = http://ftp.netfilter.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
