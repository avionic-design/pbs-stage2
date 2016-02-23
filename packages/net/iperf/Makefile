PACKAGE = iperf
VERSION = 2.0.5
LICENSE = custom

LOCATION = http://downloads.sourceforge.net/project/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/iperf \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/*.la
