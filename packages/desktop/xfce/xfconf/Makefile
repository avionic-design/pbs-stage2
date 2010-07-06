PACKAGE = xfconf
VERSION = 4.6.2

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/4.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-perl-bindings

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xfconf-query \
	$(prefix)/libexec/xfconfd \
	$(prefix)/lib/*.so.*
