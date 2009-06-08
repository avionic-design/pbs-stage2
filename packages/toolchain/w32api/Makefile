PACKAGE = w32api
VERSION = 3.12-mingw32

LOCATION = http://prdownloads.sourceforge.net/mingw
TARBALLS = $(PACKAGE)-$(VERSION)-src.tar.gz

##############################################################################

include packages/toolchain/common.mk

CPPFLAGS := $(CPPFLAGS) -DARM --sysroot $(prefix)
CFLAGS   := $(CPPFLAGS) $(CFLAGS)

conf-args = \
	--target=$(TARGET) \
	--host=$(TARGET) \
	--prefix=$(prefix)

conf-vars = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

$(pkgtree)/.configure:
	mkdir $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
