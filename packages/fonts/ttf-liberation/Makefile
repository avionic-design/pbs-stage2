PACKAGE = liberation-fonts
VERSION = 1.06.0.20100721

LOCATION = https://fedorahosted.org/releases/l/i/$(PACKAGE)
TARBALLS = $(PACKAGE)-ttf-$(VERSION).tar.gz

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
	$(priv) mkdir -p $(DESTDIR)$(ttfdir)/$(PACKAGE) && \
		$(priv) cp $(pkgtree)/$(PACKAGE)-ttf-$(VERSION)/*.ttf \
			$(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
