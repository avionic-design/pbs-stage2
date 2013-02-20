PACKAGE = i3
VERSION = 4.4
LICENSE = BSD

LOCATION = http://i3wm.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/i3 \
	$(prefix)/bin/i3bar \
	$(prefix)/bin/i3-config-wizard \
	$(prefix)/bin/i3-dump-log \
	$(prefix)/bin/i3-input \
	$(prefix)/bin/i3-msg \
	$(prefix)/bin/i3-nagbar

include packages/cleanup.mk
include packages/binary.mk
