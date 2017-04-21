PACKAGE = boost
VERSION = 1.64.0

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)_$(subst .,_,$(VERSION)).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)_$(subst .,_,$(VERSION))

bjam-flags = \
	-j $(NUM_CPU) \
	-q \
	--without-context \
	--without-coroutine \
	--without-coroutine2 \
	--without-mpi \
	--without-python

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && ./bootstrap.sh --without-icu
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		echo "using gcc : : $(TARGET)-g++ $(CFLAGS) ;" > \
			user-config.jam
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) ./bjam --prefix=$(DESTDIR)$(prefix) \
			$(bjam-flags) --user-config=user-config.jam
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) ./bjam --prefix=$(DESTDIR)$(prefix) \
			$(bjam-flags) --user-config=user-config.jam \
			install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
