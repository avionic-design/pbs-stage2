PACKAGE = attr
VERSION = 2.4.46

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).src.tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--libexecdir=$(prefix)/lib \
	--disable-gettext

conf-vars = \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE)
	$(call cmd,stamp)

install-args = \
	DESTDIR='$(DESTDIR)'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install-lib
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install-dev
	$(call cmd,stamp)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/attr \
	$(prefix)/bin/getfattr \
	$(prefix)/bin/setfattr

include packages/cleanup.mk
include packages/binary.mk
