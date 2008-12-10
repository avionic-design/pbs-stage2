PACKAGE = Python
VERSION = 2.6

LOCATION = http://python.org/ftp/python/$(VERSION)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

HOST = $(shell uname -m)

conf-host-args = \
	--with-cxx-main=g++

conf-host-vars =

conf-args = \
	--host=$(TARGET) \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-cxx-main=$(TARGET)-g++

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	CXXFLAGS='$(CFLAGS)' \
	LDFLAGS='--sysroot $(ROOTFS)' \
	ac_cv_printf_fmt_zd=yes

host-build:
	mkdir -p $(pkgtree)/obj-$(HOST) && \
		cd $(pkgtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-host-args) $(conf-host-vars)
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(MAKE)

package-configure: host-build
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	EXTRA_CFLAGS='$(CFLAGS)' \
	LDFLAGS='--sysroot $(ROOTFS) -shared' \
	HOSTPYTHON=$(pkgtree)/obj-$(HOST)/python \
	HOSTPGEN=$(pkgtree)/obj-$(HOST)/Parser/pgen

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

