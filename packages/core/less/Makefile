PACKAGE = less
VERSION = 443

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles =
stripfiles = \
	$(prefix)/bin/less \
	$(prefix)/bin/lessecho \
	$(prefix)/bin/lesskey
