PACKAGE = glmark2
VERSION = 2012.12
LICENSE = GPLv3

LOCATION = https://launchpadlibrarian.net/126103154
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

conf-vars += \
	CC='$(CC)' \
	CXX='$(CXX)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

conf-args += \
	--prefix=$(prefix) \
	--enable-glesv2 \
	--nocache


$(pkgtree)/.setup: $(setup-deps)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) $(conf-vars) ./waf configure $(conf-args)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) ./waf build -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) ./waf install --destdir=$(DESTDIR) $(install-target)
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/glmark2-es2

include packages/cleanup.mk
include packages/binary.mk
