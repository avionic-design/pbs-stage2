PACKAGE = psmisc
VERSION = 22.20
LICENSE = GPL

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-harden-flags

stripfiles = \
	$(prefix)/bin/fuser \
	$(prefix)/bin/killall \
	$(prefix)/bin/peekfd \
	$(prefix)/bin/prtstat \
	$(prefix)/bin/pstree
