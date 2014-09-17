PACKAGE = dfu-programmer
VERSION = 0.7.0

LOCATION = http://prdownloads.sf.net/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

stripfiles = \
	/usr/bin/dfu-programmer

# The 0.7.0 release is missing some files needed to reconfigure
$(pkgbuildtree)/NEWS $(pkgbuildtree)/ChangeLog:
	$(call cmd,stamp)

$(pkgtree)/.autoreconfigure: $(pkgbuildtree)/NEWS $(pkgbuildtree)/ChangeLog
