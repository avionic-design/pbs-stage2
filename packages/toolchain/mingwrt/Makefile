PACKAGE = mingwrt
VERSION = 3.15.1-mingw32

W32API_PACKAGE = w32api
W32API_VERSION = 3.12-mingw32
W32API_TARBALL = $(W32API_PACKAGE)-$(W32API_VERSION)-src.tar.gz

LOCATION = http://prdownloads.sourceforge.net/mingw
TARBALLS = \
	$(PACKAGE_FULLNAME)-src.tar.gz \
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

package-configure:
	ln -sf $(W32API_PACKAGE)-$(W32API_VERSION) $(buildtree)/$(W32API_PACKAGE)
	mkdir $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install -n

package-clean:
	@:

