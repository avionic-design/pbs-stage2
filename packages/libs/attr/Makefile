PACKAGE = attr
VERSION = 2.4.47

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).src.tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

# libtool requires bash to work properly. The configure script doesn't detect
# that properly so force it.
env += CONFIG_SHELL=/bin/bash \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--libexecdir=$(prefix)/lib \
	--disable-gettext

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
	$(prefix)/bin/setfattr \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
