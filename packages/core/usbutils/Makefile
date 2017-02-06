PACKAGE = usbutils
VERSION = 008
LICENSE = GPL

LOCATION = http://www.kernel.org/pub/linux/utils/usb/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/lsusb \
	$(prefix)/bin/usbhid-dump
