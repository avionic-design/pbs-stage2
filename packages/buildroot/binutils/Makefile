PACKAGE = binutils
VERSION = 2.18.50

#LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
LOCATION = ftp://sourceware.org/pub/binutils/snapshots
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/buildroot/autotools.mk

conf-args += \
	--with-sysroot=$(ROOTFS) \
	--disable-nls

