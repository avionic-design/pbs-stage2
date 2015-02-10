PACKAGE = ruby
VERSION = 2.2.0
LICENSE = BSD

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.ruby-lang.org/pub/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/autotools.mk
