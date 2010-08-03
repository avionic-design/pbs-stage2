PACKAGE = boost
VERSION = 1.41.0

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)_$(subst .,_,$(VERSION)).tar.bz2

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)_$(subst .,_,$(VERSION))
GCC_VERSION = $(shell $(CC) --version | head -n 1 | awk '{ print $$3}')

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && ./bootstrap.sh --without-icu
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		echo "using gcc : $(GCC_VERSION) : $(TARGET)-g++ $(CFLAGS) ;" > \
			tools/build/v2/user-config.jam
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) ./bjam --prefix=$(DESTDIR)$(prefix) \
			--without-mpi --without-python
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) ./bjam --prefix=$(DESTDIR)$(prefix) \
			--without-mpi --without-python \
			install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
