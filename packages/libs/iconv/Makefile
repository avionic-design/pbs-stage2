PACKAGE = libiconv
VERSION = 1.12

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
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
	cp support/ltmain-sysroot.sh $(pkgtree)/build-aux/ltmain.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/libcharset/build-aux/ltmain.sh
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
	$(prefix)/lib/libcharset.la \
	$(prefix)/lib/libiconv.la

stripfiles = \
	$(prefix)/bin/iconv \
	$(prefix)/lib/libcharset.so.1.0.0 \
	$(prefix)/lib/libiconv.so.2.4.0 \
	$(prefix)/lib/preloadable_libiconv.so

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

