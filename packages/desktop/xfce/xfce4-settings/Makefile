PACKAGE = xfce4-settings
VERSION = 4.10.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	/etc/xdg/autostart/xfce4-settings-helper-autostart.desktop

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
