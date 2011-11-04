PACKAGE = ptip-murnau
VERSION = 0.1.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/ptip-client \
	$(prefix)/bin/ptip-keyspy \
	$(prefix)/bin/ptip-test \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/ptipd
