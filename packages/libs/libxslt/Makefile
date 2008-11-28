PACKAGE = libxslt
VERSION = 1.1.24

LOCATION = ftp://xmlsoft.org/$(PACKAGE)
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

conf-args += \
	--without-python \
	--without-crypto

conf-vars = \
	CC="$(CC) --sysroot=$(ROOTFS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CFLAGS="$(CFLAGS)"

package-configure:
	install -m 755 support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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
	$(prefix)/lib/libexslt.la \
	$(prefix)/lib/libxslt.la

stripfiles = \
	$(prefix)/bin/xsltproc \
	$(prefix)/lib/libexslt.so.0.8.13 \
	$(prefix)/lib/libxslt.so.1.1.24

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

