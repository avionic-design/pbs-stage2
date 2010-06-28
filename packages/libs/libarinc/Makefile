PACKAGE = libarinc
VERSION = 0.2.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libarinc.la

stripfiles = \
	$(prefix)/bin/arincdump \
	$(prefix)/bin/arincsend \
	$(prefix)/bin/arincsh \
	$(prefix)/lib/libarinc.so.0.0.0
