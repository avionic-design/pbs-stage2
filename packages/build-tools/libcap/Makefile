include packages/libs/libcap/Makefile.location
include packages/build-tools/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	prefix=$(prefix) \
	lib=lib \
	PAM_CAP=no

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

# Setting DESTDIR instead of prefix is intentional to avoid an ldconfig call.
install-args = \
	prefix= \
	lib=lib \
	SBINDIR=/bin \
	RAISE_SETFCAP=no \
	PAM_CAP=no \
	DESTDIR=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
