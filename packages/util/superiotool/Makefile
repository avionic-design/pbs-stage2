PACKAGE = superiotool
VERSION = git

include packages/common.mk

SOURCETREE = $(srctree)/../kernel/superiotool.git

$(pkgtree)/.setup:
	mkdir -p $(pkgbuildtree) && cp -a $(SOURCETREE)/* $(pkgbuildtree)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	PREFIX=$(prefix) \
	CC=$(CC)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/superiotool

include packages/cleanup.mk
include packages/binary.mk
