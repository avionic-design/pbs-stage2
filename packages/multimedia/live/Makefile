PACKAGE = live
VERSION = 2012.01.26

LOCATION = http://live555.com/liveMedia/public
TARBALLS = $(PACKAGE).$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cp $(pkgsrctree)/config $(pkgtree)/$(PACKAGE)/config.pbs
	cd $(pkgtree)/$(PACKAGE) && \
		./genMakefiles pbs
	$(call cmd,stamp)

build-args = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	LDFLAGS='$(LDFLAGS)' \
	CFLAGS='$(CFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/$(PACKAGE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

dirs = BasicUsageEnvironment UsageEnvironment groupsock liveMedia

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgtree)/$(PACKAGE) && for dir in $(dirs); do \
		install -m 0755 -d $(DESTDIR)$(prefix)/lib/$(PACKAGE)/$$dir; \
		install -m 0644 $$dir/*.a \
			$(DESTDIR)$(prefix)/lib/$(PACKAGE)/$$dir; \
		install -m 0755 -d $(DESTDIR)$(prefix)/lib/$(PACKAGE)/$$dir/include; \
		install -m 0644 `ls $$dir/include/{*.h,*.hh} 2> /dev/null` \
			$(DESTDIR)$(prefix)/lib/$(PACKAGE)/$$dir/include; \
	done
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
