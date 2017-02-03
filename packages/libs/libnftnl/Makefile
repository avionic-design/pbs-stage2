PACKAGE = libnftnl
VERSION = 1.0.7
LICENSE = GPLv2+

LOCATION = http://ftp.netfilter.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
