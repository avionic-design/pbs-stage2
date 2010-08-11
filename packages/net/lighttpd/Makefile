PACKAGE = lighttpd
VERSION = 1.4.26

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download.lighttpd.net/$(PACKAGE)/releases-$(MAJOR).$(MINOR).x
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-bzip2 \
	--without-pcre \
