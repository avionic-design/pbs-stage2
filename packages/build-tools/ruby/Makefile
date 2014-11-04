PACKAGE = ruby
VERSION = 1.9.3-p286
LICENSE = BSD

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.ruby-lang.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/autotools.mk
