PACKAGE = dbus
VERSION = 1.2.12

LOCATION = http://dbus.freedesktop.org/releases/$(PACKAGE)
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
	CFLAGS='$(CFLAGS)' \
	ac_cv_have_abstract_sockets=yes

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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
	$(prefix)/lib/libdbus-1.la

stripfiles = \
	$(prefix)/bin/dbus-cleanup-sockets \
	$(prefix)/bin/dbus-daemon \
	$(prefix)/bin/dbus-launch \
	$(prefix)/bin/dbus-monitor \
	$(prefix)/bin/dbus-send \
	$(prefix)/bin/dbus-uuidgen \
	$(prefix)/lib/libdbus-1.so.3.4.0

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

