PACKAGE = dwm
VERSION = git
LICENSE = MIT/X

GIT_URL = git://git.adnet.avionic-design.de/dwm.git
ifeq ($(CONFIG_PACKAGE_WM_DWM_PATCH_REMOTE_CONTROL),y)
	GIT_CHECKOUT = remote-control-v0.1.0
endif

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS) -DVERSION=\"$(VERSION)\"' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/dwm

include packages/cleanup.mk
include packages/binary.mk
