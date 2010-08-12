PACKAGE = cgilua
VERSION = 5.1.3

LOCATION = http://luaforge.net/frs/download.php/3970
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

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
	@$(MAKE) -C $(pkgbuildtree) PREFIX=$(DESTDIR)/usr install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
