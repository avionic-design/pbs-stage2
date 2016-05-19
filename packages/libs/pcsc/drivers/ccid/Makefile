PACKAGE = ccid
VERSION = 1.4.23
LICENSE = LGPL

LOCATION = https://alioth.debian.org/frs/download.php/file/4169
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--prefix=$(prefix) \
	--enable-embedded

prunefiles = \
	$(prefix)/lib/libpcsclite.la

stripfiles = \
	$(prefix)/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Linux/libccid.so
