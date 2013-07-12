PACKAGE = xfconf
VERSION = 4.10.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-perl-bindings

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xfconf-query \
	$(prefix)/lib/xfce4/xfconf/xfconfd \
	$(prefix)/lib/*.so.*
