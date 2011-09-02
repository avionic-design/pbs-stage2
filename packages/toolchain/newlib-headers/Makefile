include packages/toolchain/newlib/Makefile.location
include packages/toolchain/common.mk

prefix := /usr

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.build
	#mkdir -p $(sysroot)$(prefix) && \
	#	cp -a $(pkgbuildtree)/newlib/libc/include \
	#		$(sysroot)$(prefix)
	$(call cmd,stamp)
