include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(SYSROOT)

quiet_cmd_gen_cmake = GEN     $@
      cmd_gen_cmake = sed 's|@TARGET@|$(TARGET)|;s|@SYSROOT@|$(SYSROOT)|' $< > $@

$(pkgtree)/cross-compile.cmake: $(srctree)/support/cross-compile.cmake.in $(pkgtree)/.extract
	$(call cmd,gen_cmake)

$(pkgtree)/.setup: $(pkgtree)/cross-compile.cmake
	$(call cmd,stamp)

cmake-args = \
	-DCMAKE_TOOLCHAIN_FILE=$(pkgtree)/cross-compile.cmake \
	-DPREFIX=$(prefix) \
	-DSYSCONFDIR=/etc

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) cmake $(cmake-args) ..
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) -j $(NUM_CPU)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
