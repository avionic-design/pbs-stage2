PACKAGE = scons
VERSION = 2.5.1
LICENSE = MIT

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://downloads.sourceforge.net/project/$(PACKAGE)/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/common.mk

$(pkgtree)/.do-install: $(pkgtree)/.extract
	cd $(pkgbuildtree) && \
		$(env) python2 setup.py install
	$(call cmd,stamp)

