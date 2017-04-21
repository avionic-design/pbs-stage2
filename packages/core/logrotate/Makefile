PACKAGE = logrotate
VERSION = 3.12.1
LICENSE = GPL

LOCATION = https://github.com/logrotate/$(PACKAGE)/releases/download/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/sbin/logrotate
