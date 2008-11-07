PACKAGE = udev
VERSION = 131

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = /dev and hotplug management daemon

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars += \
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,install_bin,$(pkgsrctree)/udev.init,$(ROOTFS)/etc/init.d/udev)
	$(call cmd,link,../init.d/udev,$(ROOTFS)/etc/rcS.d/S10udev)

stripfiles = \
	$(prefix)/sbin/udevadm \
	$(prefix)/sbin/udevd \
	$(prefix)/lib/libudev.so.0.0.4 \
	$(prefix)/lib/libvolume_id.so.1.0.4 \
	$(prefix)/lib/udev/ata_id \
	$(prefix)/lib/udev/cdrom_id \
	$(prefix)/lib/udev/collect \
	$(prefix)/lib/udev/create_floppy_devices \
	$(prefix)/lib/udev/edd_id \
	$(prefix)/lib/udev/fstab_import \
	$(prefix)/lib/udev/scsi_id \
	$(prefix)/lib/udev/usb_id \
	$(prefix)/lib/udev/vol_id

include packages/strip.mk

package-install: _install _strip
	@:

package-clean:
	@:

