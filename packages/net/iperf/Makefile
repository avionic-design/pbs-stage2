PACKAGE = iperf
VERSION = 3.0.9
LICENSE = custom

LOCATION = http://downloads.es.net/pub/iperf
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/iperf3 \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/*.la
