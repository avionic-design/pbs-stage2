PACKAGE = libxfce4util
VERSION = 4.7.3

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-broken-putenv=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/sbin/xfce4-kiosk-query \
	$(prefix)/lib/*.so.*
