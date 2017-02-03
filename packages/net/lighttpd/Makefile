PACKAGE = lighttpd
VERSION = 1.4.45

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download.lighttpd.net/$(PACKAGE)/releases-$(MAJOR).$(MINOR).x
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--without-bzip2 \
	--enable-silent-rules

