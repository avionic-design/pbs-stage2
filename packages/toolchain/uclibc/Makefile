include packages/toolchain/uclibc/Makefile.location
include packages/toolchain/common.mk
include packages/devel/uclibc/Makefile.dotconfig

$(pkgtree)/.setup:
	$(call cmd,stamp)

common-args = \
	CROSS_COMPILE=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build

$(pkgtree)/.configure: $(pkgtree)/.dotconfig
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(common-args) oldconfig
	$(call cmd,stamp)

build-args = \
	$(common-args) \
	-j $(NUM_CPU)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(common-args) install
	mv $(sysroot)/usr/lib/*crt*.o $(exec-prefix)/lib
	$(call cmd,stamp)
