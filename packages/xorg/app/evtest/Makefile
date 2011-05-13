PACKAGE = evtest
VERSION = 1.25

LOCATION = http://cgit.freedesktop.org/~whot/$(PACKAGE)/snapshot
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

stripfiles = \
	$(prefix)/bin/evtest \
	$(prefix)/bin/evtest-capture
