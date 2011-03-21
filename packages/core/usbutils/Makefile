PACKAGE = usbutils
VERSION = 002

LOCATION = http://www.kernel.org/pub/linux/utils/usb/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/lsusb \
	$(prefix)/bin/usbhid-dump
