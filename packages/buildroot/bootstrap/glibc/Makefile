PACKAGE = glibc
VERSION = 2.6.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/bootstrap/autotools.mk

env = env -i

conf-args += \
	--disable-profile \
	--enable-add-ons \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--with-headers=$(ROOTFS)$(prefix)/include \
	--without-gd \
	--without-selinux

install-args := \
	install_root=$(ROOTFS)

package-pre-install:
	mkdir -p $(ROOTFS)$(prefix)/etc
	touch $(ROOTFS)$(prefix)/etc/ld.so.conf

package-clean:
	@:

