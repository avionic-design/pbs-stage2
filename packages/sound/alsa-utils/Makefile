PACKAGE = alsa-utils
VERSION = 1.0.14

LOCATION = ftp://ftp.alsa-project.org/pub/utils
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LDFLAGS) \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

