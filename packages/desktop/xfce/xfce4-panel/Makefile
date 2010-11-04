PACKAGE = xfce4-panel
VERSION = 4.7.4

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

panel = $(prefix)/lib/xfce4/panel
plugin = $(panel)/plugins

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/xfce4-panel \
	$(prefix)/bin/xfce4-popup-windowlist \
	$(prefix)/lib/*.so.* \
	$(panel)/migrate \
	$(panel)/wrapper \
	$(plugin)/*.so
