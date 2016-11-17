PACKAGE = nodm
VERSION = 0.12-1

LOCATION = https://github.com/spanezz/$(PACKAGE)/archive/debian/
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)-debian-$(VERSION)

include packages/autotools.mk

stripfiles = \
	$(prefix)/sbin/nodm
