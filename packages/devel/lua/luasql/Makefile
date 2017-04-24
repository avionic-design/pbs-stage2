PACKAGE = luasql
VERSION = 2.3.5
LICENSE = MIT

LOCATION = https://github.com/keplerproject/$(PACKAGE)/archive
TARBALLS = v$(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

# TODO: think about supporting another driver from the remaining:
# mysql odbc postgres firebird oci8 sqlite
DRIVERS = \
	sqlite3

build-args += \
	-j $(NUM_CPU) \
	PREFIX=$(prefix) \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	$(DRIVERS)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args += \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
