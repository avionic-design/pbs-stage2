PACKAGE = luafilesystem
VERSION = 1.5.0

LOCATION = http://github.com/downloads/keplerproject/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

LUA_LIBDIR=/usr/lib/lua/5.1

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
	LUA_LIBDIR=$(DESTDIR)$(LUA_LIBDIR) \

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
