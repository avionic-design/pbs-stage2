PACKAGE = memtester
VERSION = 4.3.0
LICENSE = GPLv2

LOCATION = http://pyropus.ca/software/memtester/old-versions
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

build-args += \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

install-args += \
	INSTALLPATH='$(DESTDIR)$(prefix)'

stripfiles = $(prefix)/bin/memtester

$(pkgtree)/.build: $(pkgtree)/.patch
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd, stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd, stamp)

include packages/cleanup.mk
include packages/binary.mk
