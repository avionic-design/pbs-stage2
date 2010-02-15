PACKAGE = ttf-freefont
VERSION = 20090104

LOCATION = http://ftp.gnu.org/gnu/freefont
TARBALLS = freefont-ttf-$(VERSION).tar.gz

include packages/common.mk

pkgbuildtree = $(pkgtree)/freefont-$(VERSION)
fontsdir = $(prefix)/share/fonts
ttfdir = $(fontsdir)/truetype

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(priv) mkdir -p $(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(priv) cp $(pkgbuildtree)/*.ttf $(DESTDIR)$(ttfdir)/$(PACKAGE)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
