PACKAGE = adak
VERSION = 0.2.4

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/adak-mac \
	$(prefix)/bin/adak-sx8634 \
	$(prefix)/sbin/adak-cpld \
	$(prefix)/sbin/adak-fpga \
	$(prefix)/sbin/adak-usb-reset
