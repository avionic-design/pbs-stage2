PACKAGE = ttf-arphic-uming
VERSION = 0.2.20080216.2

LOCATION = http://de.archive.ubuntu.com/ubuntu/pool/main/f/fonts-arphic-uming
TARBALLS = fonts-arphic-uming_$(VERSION).orig.tar.bz2

include packages/common.mk

fontsdir = $(prefix)/share/fonts
ttfdir = $(fontsdir)/truetype

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(priv) mkdir -p $(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(priv) cp $(pkgtree)/$(PACKAGE)-$(VERSION)/*.ttc $(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
