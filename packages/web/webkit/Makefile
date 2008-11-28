PACKAGE = WebKit
VERSION = r38698

LOCATION = http://nightly.webkit.org/files/trunk/src
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info

conf-args += \
	--with-target=directfb

conf-vars += \
	ac_cv_path_icu_config="$(ROOTFS)$(prefix)/bin/icu-config" \
	CC="$(CC) --sysroot $(ROOTFS)" \
	CXX="$(CXX) --sysroot $(ROOTFS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)" \
	CFLAGS="$(CFLAGS)"

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../autogen.sh
	install -m 755 support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

