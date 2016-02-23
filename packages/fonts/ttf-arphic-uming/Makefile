PACKAGE = ttf-arphic-uming
VERSION = 0.2.20080216.1

LOCATION = http://de.archive.ubuntu.com/ubuntu/pool/main/t/$(PACKAGE)
TARBALLS = $(PACKAGE)_$(VERSION).orig.tar.gz

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
	$(priv) cp $(pkgtree)/*.ttc $(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
