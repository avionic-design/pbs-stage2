PACKAGE = xfce4-settings
VERSION = 4.7.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/xfce4-accessibility-settings \
	$(prefix)/bin/xfce4-appearance-settings \
	$(prefix)/bin/xfce4-display-settings \
	$(prefix)/bin/xfce4-keyboard-settings \
	$(prefix)/bin/xfce4-mouse-settings \
	$(prefix)/bin/xfce4-settings-editor \
	$(prefix)/bin/xfce4-settings-helper \
	$(prefix)/bin/xfce4-settings-manager \
	$(prefix)/bin/xfsettingsd
