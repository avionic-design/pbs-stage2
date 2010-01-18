PACKAGE = psmisc
VERSION = 22.10

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles =
stripfiles = \
	$(prefix)/bin/fuser \
	$(prefix)/bin/killall \
	$(prefix)/bin/peekfd \
	$(prefix)/bin/prtstat \
	$(prefix)/bin/pstree
