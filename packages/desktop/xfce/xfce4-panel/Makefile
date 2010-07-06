PACKAGE = xfce4-panel
VERSION = 4.6.4

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/4.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/xfce4/panel-plugins

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/xfce4-panel \
	$(prefix)/bin/xfce4-popup-windowlist \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
