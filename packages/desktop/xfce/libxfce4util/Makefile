PACKAGE = libxfce4util
VERSION = 4.6.2

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/4.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-broken-putenv=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/sbin/xfce4-kiosk-query \
	$(prefix)/lib/*.so.*
