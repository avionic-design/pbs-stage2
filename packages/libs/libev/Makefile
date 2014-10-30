PACKAGE = libev
VERSION = 4.19

LOCATION = http://dist.schmorp.de/$(PACKAGE)/Attic
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
