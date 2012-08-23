PACKAGE = logrotate
VERSION = 3.8.2
LICENSE = GPL

LOCATION = https://fedorahosted.org/releases/l/o/$(PACKAGE)
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
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	PREFIX='$(DESTDIR)' \
	BASEDIR='$(prefix)' \
	MANDIR='$$(BASEDIR)/share/man'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/logrotate

include packages/cleanup.mk
include packages/binary.mk
