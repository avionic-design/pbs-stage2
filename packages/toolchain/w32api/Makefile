PACKAGE = w32api
VERSION = 3.12-mingw32

LOCATION = http://prdownloads.sourceforge.net/mingw
TARBALLS = $(PACKAGE_FULLNAME)-src.tar.gz

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

package-configure:
	mkdir $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install -n

package-clean:
	@:

