include packages/autotools.mk

ACLOCAL_FLAGS = -I $(srctree)/toolchains/$(TARGET)/usr/share/aclocal

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--with-sysroot=$(SYSROOT)
