PACKAGE = bluez
VERSION = 4.46

LOCATION = http://www.kernel.org/pub/linux/bluetooth
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--enable-hidd

alsa = $(prefix)/lib/alsa-lib
plugin = $(prefix)/lib/bluetooth/plugins
gstreamer = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(alsa)/*.la \
	$(plugin)/*.la \
	$(gstreamer)/*.la \
	$(prefix)/lib/libbluetooth.la

stripfiles = \
	$(prefix)/bin/ciptool \
	$(prefix)/bin/hcitool \
	$(prefix)/bin/hidd \
	$(prefix)/bin/l2ping \
	$(prefix)/bin/rfcomm \
	$(prefix)/bin/sdptool \
	$(alsa)/*.so \
	$(plugin)/*.so \
	$(gstreamer)/*.so \
	$(prefix)/lib/libbluetooth.so.3.2.6 \
	$(prefix)/sbin/bluetoothd \
	$(prefix)/sbin/hciattach \
	$(prefix)/sbin/hciconfig
