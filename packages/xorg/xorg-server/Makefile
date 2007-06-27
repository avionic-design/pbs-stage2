PACKAGE = xorg-server
VERSION = 1.3.0.0

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include packages/common.mk

env += PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

ac-cache = \
	ac_cv_file__usr_share_X11_sgml_defs_ent=no

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--disable-dri \
	$(call set-args, AR CC CFLAGS LDFLAGS RANLIB STRIP) \
	$(ac-cache)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

