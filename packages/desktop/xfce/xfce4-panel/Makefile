PACKAGE = xfce4-panel
VERSION = 4.10.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
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
