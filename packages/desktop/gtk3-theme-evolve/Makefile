PACKAGE = gtk3-theme-evolve
VERSION = 2013.10.30
LICENSE = GPLv3

LOCATION = http://fc04.deviantart.net/fs71/f/2013/302/4/7/
TARBALLS = evolve___gtk3_theme_by_satya164-d4dn66o.zip

include packages/common.mk

themename = Evolve
pkgbuildtree = $(pkgtree)/$(themename)
themesdir = $(prefix)/share/themes

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(priv) mkdir -p $(DESTDIR)$(themesdir)/$(themename)
	$(priv) cp -r $(pkgbuildtree)/* $(DESTDIR)$(themesdir)/$(themename)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
