PACKAGE = udev
VERSION = 172

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--prefix= \
	--sbindir=/sbin \
	--includedir=$(prefix)/include \
	--datarootdir=$(prefix)/share \
	--libdir=$(prefix)/lib \
	--libexecdir=/lib/udev \
	--with-pci-ids-path=$(prefix)/share/pci.ids.gz \
	--with-sysroot=$(SYSROOT) \
	--disable-introspection \
	--disable-udev_acl \
	--disable-rpath

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

ifneq ($(CONFIG_PACKAGE_CORE_UDEV_GLIB),y)
  conf-args += \
	--disable-gudev
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
