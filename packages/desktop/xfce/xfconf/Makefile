PACKAGE = xfconf
VERSION = 4.7.3

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
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
