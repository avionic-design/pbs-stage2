PACKAGE = xfwm4
VERSION = 4.7.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/xfwm4 \
	$(prefix)/bin/xfwm4-settings \
	$(prefix)/bin/xfwm4-tweaks-settings \
	$(prefix)/bin/xfwm4-workspace-settings \
	$(prefix)/lib/xfce4/xfwm4/helper-dialog
