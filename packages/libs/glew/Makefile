PACKAGE = glew
VERSION = 1.5.7

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	SYSTEM="linux" \
	M_ARCH=$(ARCH) \
	CC='$(CC)' \
	CFLAGS.EXTRA='$(CFLAGS)' \
	LD='$(CC)' \
	LDFLAGS.EXTRA='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	SYSTEM="linux" \
	M_ARCH=$(ARCH) \
	GLEW_DEST=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/glewinfo \
	$(prefix)/bin/visualinfo \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
