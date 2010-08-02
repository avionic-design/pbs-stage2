PACKAGE = w32api
VERSION = 3.12-mingw32

LOCATION = http://prdownloads.sourceforge.net/mingw
TARBALLS = $(PACKAGE)-$(VERSION)-src.tar.gz

include packages/toolchain/common.mk

CPPFLAGS := $(CPPFLAGS) -DARM --sysroot $(prefix)
CFLAGS   := $(CPPFLAGS) $(CFLAGS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--host=$(TARGET) \
	--prefix=$(prefix)

conf-vars = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
