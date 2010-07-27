PACKAGE = glib
VERSION = 2.25.11

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.25
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.setup
	mkdir $(pkgbuildtree)/obj-$(BUILD) && \
		cd $(pkgbuildtree)/obj-$(BUILD) && \
			../configure --prefix=$(prefix)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(MAKE)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(BUILD) && \
		$(MAKE) install
	$(call cmd,stamp)
