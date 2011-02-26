PACKAGE = xrandr
VERSION = 1.3.4

LOCATION = http://xorg.freedesktop.org/releases/individual/app
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

pronefiles = \
	$(prefix)/bin/xkeystone

stripfiles = \
	$(prefix)/bin/xrandr
