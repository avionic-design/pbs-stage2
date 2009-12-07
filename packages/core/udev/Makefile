PACKAGE = udev
VERSION = 149

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = /dev and hotplug management daemon

include packages/autotools.mk

conf-args = \
	--host=$(TARGET) \
	--prefix= \
	--includedir=$(prefix)/include \
	--datarootdir=$(prefix)/share \
	--libdir=$(prefix)/lib \
	--libexecdir=/lib/udev \
	--sysconfdir=/etc

conf-args += \
	--disable-extras \
	--disable-introspection

prunefiles = \
	$(prefix)/lib/libudev.la

stripfiles = \
	/lib/udev/ata_id \
	/lib/udev/cdrom_id \
	/lib/udev/collect \
	/lib/udev/create_floppy_devices \
	/lib/udev/edd_id \
	/lib/udev/fstab_import \
	/lib/udev/input_id \
	/lib/udev/path_id \
	/lib/udev/scsi_id \
	/lib/udev/usb_id \
	/lib/udev/v4l_id \
	/lib/udev/vol_id \
	/sbin/udevadm \
	/sbin/udevd \
	$(prefix)/lib/libudev.so.0.5.1 \
	$(prefix)/lib/libvolume_id.so.1.1.0
