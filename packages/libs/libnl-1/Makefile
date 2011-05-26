PACKAGE = libnl
VERSION = 1.1

LOCATION = http://www.infradead.org/~tgr/$(PACKAGE)/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

HOST_GNU_TYPE = $(shell $(srctree)/support/config.sub $(TARGET))
BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix)

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	V=1

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk

