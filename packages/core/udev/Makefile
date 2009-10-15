PACKAGE = udev
VERSION = 146

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = /dev and hotplug management daemon

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))
LIBC := $(shell echo $(CONFIG_LIBC))

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
	--libexecdir=/lib/udev \
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
	$(call cmd,stamp)

prunefiles = \
	/lib/libudev.la

stripfiles = \
	/lib/libudev.so.0.5.0 \
	/lib/udev/ata_id \
	/lib/udev/cdrom_id \
	/lib/udev/collect \
	/lib/udev/create_floppy_devices \
	/lib/udev/edd_id \
	/lib/udev/fstab_import \
	/lib/udev/path_id \
	/lib/udev/scsi_id \
	/lib/udev/usb_id \
	/lib/udev/v4l_id \
	/lib/udev/vol_id \
	$(prefix)/lib/libvolume_id.so.1.1.0 \
	/sbin/udevadm \
	/sbin/udevd

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
