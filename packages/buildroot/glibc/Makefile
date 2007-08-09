PACKAGE = glibc
VERSION = 2.6.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/buildroot/autotools.mk

# from LFS
#conf-args := \
	--prefix=$(prefix) \
	--enable-addons=ports \
	--enable-kernel=2.6.0 \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--without-gd \
	--with-headers=$(prefix)/include \
	--disable-profile \
	--without-selinux

conf-args += \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--enable-addons=ports

package-pre-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

build-vars += \
	MAKEFLAGS=

install-args := \
	install_root=$(ROOTFS)

