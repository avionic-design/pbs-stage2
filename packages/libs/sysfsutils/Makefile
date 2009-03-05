PACKAGE = sysfsutils
VERSION = 2.1.0

LOCATION = http://ovh.dl.sourceforge.net/sourceforge/linux-diag
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
	cp support/config.{guess,sub} $(pkgtree)
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

PHONY += package-do-install
package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

sover = 2.0.1

prunefiles = \
	$(prefix)/lib/libsysfs.la

stripfiles = \
	$(prefix)/bin/dlist_test \
	$(prefix)/bin/get_device \
	$(prefix)/bin/get_driver \
	$(prefix)/bin/get_module \
	$(prefix)/bin/systool \
	$(prefix)/lib/libsysfs.so.$(sover)

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

