PACKAGE = libevent
VERSION = 2.1.8
LICENSE = BSD

LOCATION = https://github.com/$(PACKAGE)/$(PACKAGE)/releases/download/release-$(VERSION)-stable
TARBALLS = $(PACKAGE)-$(VERSION)-stable.tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)-stable

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
