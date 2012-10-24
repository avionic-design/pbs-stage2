PACKAGE = hostapd
VERSION = 0.7.3

LOCATION = http://w1.fi/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	EXTRA_LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/$(PACKAGE) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	INSTALL_MAN=$(DESTDIR)$(prefix)/share/man \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/$(PACKAGE) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/hostapd \
	$(prefix)/bin/hostapd_cli

include packages/cleanup.mk
include packages/binary.mk
