PACKAGE = libnl
VERSION = 2.0

LOCATION = http://www.infradead.org/~tgr/$(PACKAGE)/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
