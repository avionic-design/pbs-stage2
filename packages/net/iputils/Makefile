PACKAGE = iputils
VERSION = s20071127

LOCATION = http://www.skbuff.net/iputils
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CC=$(CC) \
	CFLAGS="$(CFLAGS) -D_GNU_SOURCE" \
	LDFLAGS="$(LDFLAGS)" \
	IPV4_TARGETS='ping arping' \
	IPV6_TARGETS='ping6'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(priv) install -d $(DESTDIR)$(prefix)/bin
	cd $(pkgbuildtree) && \
		$(priv) install -t $(DESTDIR)$(prefix)/bin ping arping ping6
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/bin/arping \
	$(prefix)/bin/ping \
	$(prefix)/bin/ping6

include packages/cleanup.mk
include packages/binary.mk
