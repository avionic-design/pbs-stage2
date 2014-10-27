PACKAGE = usbutils
VERSION = 007
LICENSE = GPL

LOCATION = http://www.kernel.org/pub/linux/utils/usb/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--datadir=$(prefix)/share/hwdata

stripfiles = \
	$(prefix)/bin/lsusb \
	$(prefix)/bin/usbhid-dump
