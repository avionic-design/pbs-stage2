PACKAGE = libev
VERSION = 4.04

LOCATION = http://dist.schmorp.de/$(PACKAGE)/Attic
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && mkdir -p m4 && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
