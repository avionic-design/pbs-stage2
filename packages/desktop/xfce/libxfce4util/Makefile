PACKAGE = libxfce4util
VERSION = 4.10.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-broken-putenv=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/sbin/xfce4-kiosk-query \
	$(prefix)/lib/*.so.*
