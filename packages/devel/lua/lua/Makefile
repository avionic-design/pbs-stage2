PACKAGE = lua
VERSION = 5.3.4
LICENSE = MIT

LOCATION = http://www.lua.org/ftp
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS) -DLUA_USE_LINUX -DLUA_COMPAT_5_2 -DLUA_COMPAT_5_1' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(MAKE) $(build-args) linux
	$(call cmd,stamp)

install-args = \
	INSTALL_TOP=$(DESTDIR)$(prefix) \
	INSTALL_MAN=$(DESTDIR)$(prefix)/share/man

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/lua \
	$(prefix)/bin/luac

include packages/cleanup.mk
include packages/binary.mk
