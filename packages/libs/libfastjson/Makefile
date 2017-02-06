PACKAGE = libfastjson
VERSION = 0.99.4
LICENSE = MIT

LOCATION = http://download.rsyslog.com/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
