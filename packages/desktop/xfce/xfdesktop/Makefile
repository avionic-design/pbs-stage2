PACKAGE = xfdesktop
VERSION = 4.6.2

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/4.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/xfce4/modules

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/xfce4-popup-menu \
	$(prefix)/bin/xfdesktop \
	$(prefix)/bin/xfdesktop-settings \
	$(prefix)/libexec/xfce4/panel-plugins/xfce4-menu-plugin \
	$(plugin)/*.so
