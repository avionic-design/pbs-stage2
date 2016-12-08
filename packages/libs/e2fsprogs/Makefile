PACKAGE = e2fsprogs-libs
VERSION = 1.43.3

LOCATION = http://prdownloads.sourceforge.net/e2fsprogs
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-elf-shlibs \
	--disable-libblkid \
	--disable-rpath \
	--disable-tls

stripfiles = \
	$(prefix)/lib/libcom_err.so.2.1 \
	$(prefix)/lib/libss.so.2.0
