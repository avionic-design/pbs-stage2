PACKAGE = acsccid
VERSION = 1.1.3
LICENSE =

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))
PATCH = $(word 3,$(subst ., ,$(VERSION)))

LOCATION = http://www.acs.com.hk/download-driver-unified/5128/

TARBALLS = ACS-Unified-PKG-Lnx-$(MAJOR)$(MINOR)$(PATCH)-P.zip

INSTALL_FILE = fedora/24/pcsc-lite-$(PACKAGE)-$(VERSION)-1.fc24.i686.rpm

include packages/common.mk

pkgbuildtree := $(pkgtree)/ACS-Unified-PKG-Lnx-$(MAJOR)$(MINOR)$(PATCH)-P/$(PACKAGE)_linux_bin-$(VERSION)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(DESTDIR) && cd $(DESTDIR) && rpm2cpio $(pkgbuildtree)/$(INSTALL_FILE) | cpio -idm

	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk


