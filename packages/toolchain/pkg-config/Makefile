PACKAGE = pkg-config
VERSION = 0.23

LOCATION = http://pkgconfig.freedesktop.org/releases
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/toolchain/common.mk

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man

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

ifneq ($(ROOTFS),)
  install-args = \
	DESTDIR=$(ROOTFS)
endif

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

