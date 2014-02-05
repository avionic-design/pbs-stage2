PACKAGE = dtc
VERSION = v1.4.0
LICENSE = GPL

# Upstream didn't provide any tarball, so we have to pull it from git
GIT_URL = http://git.jdl.com/software/dtc.git
GIT_CHECKOUT = $(VERSION)

include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	PREFIX=$(prefix) \
	INSTALL=install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
