PACKAGE = libwnck
VERSION = 2.30.2

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.30
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/wnckprop \
	$(prefix)/bin/wnck-urgency-monitor \
	$(prefix)/lib/*.so.*
