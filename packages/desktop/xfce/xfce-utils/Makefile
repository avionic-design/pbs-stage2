PACKAGE = xfce-utils
VERSION = 4.7.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib

prunefiles = \
	/etc/xdg/autostart/xfconf-migration-4.6.desktop

stripfiles = \
	$(prefix)/bin/xfce4-about \
	$(prefix)/bin/xfrun4
