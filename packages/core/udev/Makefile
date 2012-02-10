PACKAGE = udev
VERSION = 181

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--libdir=$(prefix)/lib \
	--libexecdir=$(prefix)/lib \
	--with-pci-ids-path=$(prefix)/share/hwdata/pci.ids.gz \
	--with-usb-ids-path=$(prefix)/share/hwdata/usb.ids.gz \
	--with-firmware-path=/lib/firmware \
	--disable-introspection

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

ifneq ($(CONFIG_PACKAGE_CORE_UDEV_GLIB),y)
  conf-args += \
	--disable-gudev
endif

compat-links = \
	/sbin/udevadm \
	/sbin/udevd

compat-links := $(addprefix $(DESTDIR),$(compat-links))

$(compat-links): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_link)

$(pkgtree)/.prune: $(compat-links)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/udevadm \
	$(prefix)/lib/udev/accelerometer \
	$(prefix)/lib/udev/ata_id \
	$(prefix)/lib/udev/cdrom_id \
	$(prefix)/lib/udev/collect \
	$(prefix)/lib/udev/create_floppy_devices \
	$(prefix)/lib/udev/edd_id \
	$(prefix)/lib/udev/firmware \
	$(prefix)/lib/udev/fstab_import \
	$(prefix)/lib/udev/hid2hci \
	$(prefix)/lib/udev/input_id \
	$(prefix)/lib/udev/keymap \
	$(prefix)/lib/udev/mobile-action-modeswitch \
	$(prefix)/lib/udev/mtd_probe \
	$(prefix)/lib/udev/path_id \
	$(prefix)/lib/udev/pci-db \
	$(prefix)/lib/udev/scsi_id \
	$(prefix)/lib/udev/udevd \
	$(prefix)/lib/udev/usb-db \
	$(prefix)/lib/udev/usb_id \
	$(prefix)/lib/udev/v4l_id \
	$(prefix)/lib/udev/vol_id \
	$(prefix)/lib/*.so.*
