PACKAGE = rings
VERSION = 1.2.3

LOCATION = http://github.com/downloads/keplerproject/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

LUA_VERSION=5.1
LUA_PREFIX=/usr
LUA_DIR=$(LUA_PREFIX)/share/lua/$(LUA_VERSION)
LUA_LIBDIR=$(LUA_PREFIX)/lib/lua/$(LUA_VERSION)
LUA_BINDIR=$(LUA_PREFIX)/bin

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args += \
        -j $(NUM_CPU) \
	PREFIX=/usr \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args += \
	LUA_DIR=$(DESTDIR)$(LUA_DIR) \
	LUA_LIBDIR=$(DESTDIR)$(LUA_LIBDIR) \

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
