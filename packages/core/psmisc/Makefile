PACKAGE = psmisc
VERSION = 22.21
LICENSE = GPL

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--disable-harden-flags

stripfiles = \
	$(prefix)/bin/fuser \
	$(prefix)/bin/killall \
	$(prefix)/bin/peekfd \
	$(prefix)/bin/prtstat \
	$(prefix)/bin/pstree
