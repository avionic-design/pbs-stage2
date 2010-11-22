PACKAGE = xfdesktop
VERSION = 4.7.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
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
