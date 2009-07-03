PACKAGE = udev
VERSION = 140

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = /dev and hotplug management daemon

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix= \
	--includedir=$(prefix)/include \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--disable-extras

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	#$(call cmd,install_dir,$(DESTDIR)/etc/init.d)
	#$(call cmd,install_dir,$(DESTDIR)/etc/rcS.d)
	#$(call cmd,install_bin,$(pkgsrctree)/udev.init,$(DESTDIR)/etc/init.d/udev)
	#$(call cmd,link,../init.d/udev,$(DESTDIR)/etc/rcS.d/S03udev)
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/udevadm \
	$(prefix)/sbin/udevd \
	$(prefix)/lib/libudev.so.0.1.0 \
	$(prefix)/lib/libvolume_id.so.1.1.0 \
	$(prefix)/lib/udev/ata_id \
	$(prefix)/lib/udev/cdrom_id \
	$(prefix)/lib/udev/collect \
	$(prefix)/lib/udev/create_floppy_devices \
	$(prefix)/lib/udev/edd_id \
	$(prefix)/lib/udev/fstab_import \
	$(prefix)/lib/udev/scsi_id \
	$(prefix)/lib/udev/usb_id \
	$(prefix)/lib/udev/vol_id

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
