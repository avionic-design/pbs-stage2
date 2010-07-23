PACKAGE = mutter
VERSION = 2.31.5

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.31
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-introspection

plugin = $(prefix)/lib/mutter/plugins

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/mutter \
	$(prefix)/bin/mutter-message \
	$(prefix)/bin/mutter-theme-viewer \
	$(prefix)/bin/mutter-window-demo \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
