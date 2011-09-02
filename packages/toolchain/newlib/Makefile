include packages/toolchain/newlib/Makefile.location
include packages/toolchain/common.mk

#prefix := /usr

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--enable-multilib

ifeq ($(CONFIG_ARCH),arm)
  conf-args += --enable-interwork
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) all
	$(call cmd,stamp)

#install-args = \
	DESTDIR=$(sysroot)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install
	#mv $(sysroot)$(prefix)/$(TARGET)/include/* $(sysroot)$(prefix)/include
	#mv $(sysroot)$(prefix)/$(TARGET)/lib/* $(sysroot)$(prefix)/lib
	$(call cmd,stamp)
