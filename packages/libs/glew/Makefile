PACKAGE = glew
VERSION = 2.0.0
LICENSE = BSD MIT GPL

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	SYSTEM="$(OS)" \
	M_ARCH=$(MACHINE) \
	CC='$(CC)' \
	CFLAGS.EXTRA='$(CFLAGS)' \
	LD='$(CC)' \
	LDFLAGS.EXTRA='$(LDFLAGS)' \
	STRIP=''

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	SYSTEM="$(OS)" \
	M_ARCH=$(MACHINE) \
	GLEW_DEST=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
