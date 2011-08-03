PACKAGE = zvbi
VERSION = 0.2.33

LOCATION = http://prdownloads.sourceforge.net/zapping
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/zvbi-atsc-cc \
	$(prefix)/bin/zvbi-chains \
	$(prefix)/bin/zvbi-ntsc-cc \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/zvbid
