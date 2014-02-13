PACKAGE = wsapi
VERSION = 1.4

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
	cd $(pkgbuildtree) && \
		find -name '*.so' -o -name '*.o' -exec rm '{}' ';' && \
		find -name '*.lua' -o -name 'wsapi.cgi' -exec sed 's,\r$$,,' -i '{}' ';' && \
		echo "LIB_OPTION= -shared" > config && \
		echo "LUA_DIR= $(DESTDIR)$(LUA_DIR)" >> config && \
		echo "BIN_DIR= $(DESTDIR)$(LUA_BINDIR)" >> config && \
		echo "LUA_LIBDIR= $(DESTDIR)$(LUA_LIBDIR)" >> config
	$(call cmd,stamp)

build-args += \
        -j $(NUM_CPU) \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args) cgi
	$(call cmd,stamp)

install-args += \

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
