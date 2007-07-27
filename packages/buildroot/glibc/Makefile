PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/buildroot/autotools.mk

conf-args += \
	--with-headers=$(ROOTFS)/tools/include \
	--enable-addons=ports

package-pre-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

build-vars += \
	MAKEFLAGS=

install-args := \
	install_root=$(ROOTFS)

