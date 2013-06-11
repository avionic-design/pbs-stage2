PACKAGE = iw
VERSION = 3.3

LOCATION = https://www.kernel.org/pub/software/network/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

#pkgbuildtree := $(pkgtree)/$(subst -,_,$(PACKAGE)).$(VERSION)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' V=1 \
	EXTRA_CFLAGS='$(CFLAGS)' \
	EXTRA_LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	INSTALL_MAN=$(DESTDIR)$(prefix)/share/man \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/iw

include packages/cleanup.mk
include packages/binary.mk
