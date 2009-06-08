PACKAGE = mingwrt
VERSION = 3.15.1-mingw32

W32API_PACKAGE = w32api
W32API_VERSION = 3.12-mingw32
W32API_TARBALL = $(W32API_PACKAGE)-$(W32API_VERSION)-src.tar.gz

LOCATION = http://prdownloads.sourceforge.net/mingw
TARBALLS = \
	$(PACKAGE)-$(VERSION)-src.tar.gz \
	$(W32API_TARBALL)

##############################################################################

include packages/toolchain/common.mk

CPPFLAGS := $(CPPFLAGS) -DARM --sysroot $(prefix)
CFLAGS   := $(CPPFLAGS) $(CFLAGS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix)

conf-vars = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

$(pkgtree)/.configure:
	ln -sf $(W32API_PACKAGE)-$(W32API_VERSION) $(buildtree)/$(W32API_PACKAGE)
	mkdir $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
