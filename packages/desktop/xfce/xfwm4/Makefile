PACKAGE = xfwm4
VERSION = 4.10.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/xfwm4 \
	$(prefix)/bin/xfwm4-settings \
	$(prefix)/bin/xfwm4-tweaks-settings \
	$(prefix)/bin/xfwm4-workspace-settings \
	$(prefix)/lib/xfce4/xfwm4/helper-dialog
