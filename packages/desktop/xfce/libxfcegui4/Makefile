PACKAGE = libxfcegui4
VERSION = 4.6.4

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/4.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libglade/2.0/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/libglade/2.0/*.so \
	$(prefix)/lib/*.so.*
