include packages/toolchain/uclibc/Makefile.location
include packages/toolchain/common.mk
include packages/devel/uclibc/Makefile.dotconfig

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build

$(pkgtree)/.configure: $(pkgtree)/.dotconfig
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(conf-args) oldconfig
	$(call cmd,stamp)

build-args = \
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build \
	-j $(NUM_CPU)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	CROSS=$(TARGET)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgtree)/build

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	mv $(sysroot)/usr/lib/*crt*.o $(exec-prefix)/lib
	$(call cmd,stamp)
