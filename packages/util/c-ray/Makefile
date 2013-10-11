PACKAGE = c-ray
VERSION = 1.1
LICENSE = custom

LOCATION = http://www.futuretech.blinkenlights.nl/depot
TARBALLS = ${PACKAGE}-${VERSION}.tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	prefix='$(prefix)' \
	DESTDIR='$(DESTDIR)'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/c-ray-f \
	$(prefix)/bin/c-ray-mt

include packages/cleanup.mk
include packages/binary.mk
