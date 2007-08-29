PACKAGE = glibc
VERSION = 2.6.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/buildroot/autotools.mk

conf-args += \
	--disable-profile \
	--enable-add-ons \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--with-headers=$(ROOTFS)$(prefix)/include \
	--without-gd \
	--without-selinux

build-vars += \
	MAKEFLAGS=

install-args := \
	install_root=$(ROOTFS)

#package-post-build:
#	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) check

#package-pre-install:
#	mkdir $(ROOTFS)$(prefix)/etc
#	touch $(ROOTFS)$(prefix)/etc/ld.so.conf

