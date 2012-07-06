PACKAGE = live
VERSION = 2012.07.03
LICENSE = LGPL

LOCATION = http://live555.com/liveMedia/public
TARBALLS = $(PACKAGE).$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)
include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/config $(pkgbuildtree)/config.pbs
	cd $(pkgbuildtree) && ./genMakefiles pbs
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	LDFLAGS='$(LDFLAGS)' \
	CFLAGS='$(CFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

dirs = BasicUsageEnvironment groupsock liveMedia UsageEnvironment

$(pkgtree)/.do-install: $(pkgtree)/.build
	install -m 0755 -d $(DESTDIR)$(prefix)/lib
	install -m 0755 -d $(DESTDIR)$(prefix)/include
	cd $(pkgbuildtree) && for dir in $(dirs); do \
		install -m 0755 -d $(DESTDIR)$(prefix)/include/$$dir; \
		install -m 0644 $$dir/*.a \
			$(DESTDIR)$(prefix)/lib; \
		install -m 0644 $$dir/include/*.hh \
			$(DESTDIR)$(prefix)/include/$$dir; \
	done
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
