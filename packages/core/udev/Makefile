PACKAGE = udev
VERSION = 167

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args = \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix= \
	--sbindir=/sbin \
	--includedir=$(prefix)/include \
	--datarootdir=$(prefix)/share \
	--libdir=$(prefix)/lib \
	--libexecdir=/lib/udev \
	--sysconfdir=/etc

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

ifeq ($(CONFIG_PACKAGE_CORE_UDEV_DISABLE_EXTRAS),y)
conf-args += \
	--disable-extras
else
conf-args += \
	--with-pci-ids-path=/usr/share/pci.ids.gz
endif

conf-args += \
	--disable-introspection

ifneq ($(CONFIG_PACKAGE_CORE_UDEV_GLIB),y)
  conf-args += \
	--disable-glib
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	/lib/udev/ata_id \
	/lib/udev/cdrom_id \
	/lib/udev/collect \
	/lib/udev/create_floppy_devices \
	/lib/udev/edd_id \
	/lib/udev/firmware \
	/lib/udev/fstab_import \
	/lib/udev/hid2hci \
	/lib/udev/input_id \
	/lib/udev/keymap \
	/lib/udev/mobile-action-modeswitch \
	/lib/udev/mtd_probe \
	/lib/udev/path_id \
	/lib/udev/pci-db \
	/lib/udev/scsi_id \
	/lib/udev/usb-db \
	/lib/udev/usb_id \
	/lib/udev/v4l_id \
	/lib/udev/vol_id \
	/sbin/udevadm \
	/sbin/udevd \
	$(prefix)/lib/*.so.*
