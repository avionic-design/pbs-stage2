PACKAGE = iperf
VERSION = 2.0.9
LICENSE = custom

LOCATION = https://iperf.fr/download/source
TARBALLS = $(PACKAGE)-$(VERSION)-source.tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/iperf \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/*.la
