PACKAGE = expat
VERSION = 2.0.1

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/conftools/ltmain.sh
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =
package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libexpat.la

stripfiles = \
	$(prefix)/bin/xmlwf \
	$(prefix)/lib/libexpat.so.1.5.2

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

