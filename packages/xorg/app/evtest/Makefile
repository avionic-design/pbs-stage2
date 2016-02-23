PACKAGE = evtest
VERSION = 1.32
LICENSE = GPL

LOCATION = http://cgit.freedesktop.org/$(PACKAGE)/snapshot
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-vars += \
	ac_cv_path_XMLTO= \
	ac_cv_path_ASCIIDOC=

stripfiles = \
	$(prefix)/bin/evtest
