PACKAGE = pcsc-lite
VERSION = 1.8.13

LOCATION = https://alioth.debian.org/frs/download.php/file/3298
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

# Fix the path inside the tarball
pkgbuildtree = $(pkgtree)/$(PACKAGE)-1.6.1

include packages/autotools.mk

conf-args += \
	--enable-usbdropdir=$(prefix)/lib/pcsc/drivers

ifneq ($(CONFIG_PACKAGE_LIBS_PCSC_LITE_HAL),y)
conf-args += \
	--disable-libhal
endif

prunefiles = \
	$(prefix)/lib/libpcsclite.la

stripfiles = \
	$(prefix)/lib/libpcsclite.so.1.0.0 \
	$(prefix)/sbin/pcscd
