PACKAGE = bluez
VERSION = 5.44

LOCATION = http://www.kernel.org/pub/linux/bluetooth
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--enable-library

# bluez needs its own headers installed first...
$(pkgtree)/.install-headers:
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(priv) $(MAKE) DESTDIR=$(SYSROOT) install-includeHEADERS
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.install-headers

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
