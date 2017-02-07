PACKAGE = scmccid
VERSION = 5.0.35
LICENSE =

LOCATION = http://files.identiv.com/products/smart-card-readers/common-drivers

TARBALLS = $(PACKAGE)_$(VERSION)_linux.tar.gz

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)_$(VERSION)_linux

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	@install -m 755 -d $(DESTDIR)$(prefix)/local/identiv
	@cp $(pkgbuildtree)/scmccid.ini $(DESTDIR)$(prefix)/local/identiv

	@install -m 755 -d $(DESTDIR)$(prefix)/lib/pcsc/drivers
	@cp -rf $(pkgbuildtree)/proprietary/* $(DESTDIR)$(prefix)/lib/pcsc/drivers

	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk


