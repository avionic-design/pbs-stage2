PACKAGE = binutils
VERSION = 2.18.50

LOCATION = ftp://sourceware.org/pub/binutils/snapshots
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/buildroot/autotools.mk

conf-args += \
	--disable-nls

#package-post-install:
#	make -C ld clean
#	make -C ld LIB_PATH=/tools/lib
#	cp -v ld/ld-new /tools/bin

