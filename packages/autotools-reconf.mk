include packages/autotools.mk

ACLOCAL_FLAGS = -I $(TOOLCHAIN_BASE_PATH)/$(TARGET)/usr/share/aclocal

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--with-sysroot=$(SYSROOT)
