PACKAGE = strace
VERSION = 4.14
LICENSE = BSD

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles =
stripfiles = \
	$(prefix)/bin/strace
