PACKAGE = binutils
#VERSION = 2.17
VERSION = 2.18.50

#LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
LOCATION = ftp://sourceware.org/pub/binutils/snapshots
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/buildroot/autotools.mk

#env += LIBDIR=$(prefix)/lib

conf-args += \
	--with-sysroot=$(ROOTFS) \
	--disable-nls

#package-post-install:
#	cd $(pkgtree) && $(MAKE) -C ld clean
#	cd $(pkgtree) && $(MAKE) -C ld LIBDIR=$(prefix)/lib

