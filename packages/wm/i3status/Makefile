PACKAGE = i3status
VERSION = 2.6
LICENSE = BSD

LOCATION = http://i3wm.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch

build-args = \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install

include packages/cleanup.mk
include packages/binary.mk
