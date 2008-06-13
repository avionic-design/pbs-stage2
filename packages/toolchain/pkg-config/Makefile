PACKAGE = pkg-config
VERSION = 0.23

LOCATION = http://pkgconfig.freedesktop.org/releases
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--sysconfdir=/etc

conf-args += \
	--program-prefix=$(TARGET)- \
	--with-installed-glib

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(PLATFORM)

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

