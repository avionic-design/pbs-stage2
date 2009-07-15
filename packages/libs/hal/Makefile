PACKAGE = hal
VERSION = 0.5.13

LOCATION = http://hal.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

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
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--libexecdir=$(prefix)/lib/hal \
	--mandir=$(prefix)/share/man \
	--with-udev-prefix=/lib \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-args += \
	--disable-policy-kit \
	--disable-pci-ids \
	--disable-usb-ids

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
	$(prefix)/lib/libhal-storage.la \
	$(prefix)/lib/libhal.la

plugin = $(prefix)/lib/hal
sover  = 1.0.0

stripfiles = \
	$(prefix)/bin/hal-device \
	$(prefix)/bin/hal-disable-polling \
	$(prefix)/bin/hal-find-by-capability \
	$(prefix)/bin/hal-find-by-property \
	$(prefix)/bin/hal-get-property \
	$(prefix)/bin/hal-is-caller-locked-out \
	$(prefix)/bin/hal-lock \
	$(prefix)/bin/hal-set-property \
	$(prefix)/bin/hal-setup-keymap \
	$(prefix)/bin/lshal \
	$(prefix)/lib/libhal.so.$(sover) \
	$(prefix)/lib/libhal-storage.so.$(sover) \
	$(plugin)/hal-storage-cleanup-all-mountpoints \
	$(plugin)/hal-storage-cleanup-mountpoint \
	$(plugin)/hal-storage-closetray \
	$(plugin)/hal-storage-eject \
	$(plugin)/hal-storage-mount \
	$(plugin)/hal-storage-unmount \
	$(plugin)/hal-system-power-pm-is-supported \
	$(plugin)/hal-system-power-pmu \
	$(plugin)/hal-system-setserial \
	$(plugin)/hal-system-sonypic \
	$(plugin)/hald-addon-acpi \
	$(plugin)/hald-addon-cpufreq \
	$(plugin)/hald-addon-generic-backlight \
	$(plugin)/hald-addon-hid-ups \
	$(plugin)/hald-addon-input \
	$(plugin)/hald-addon-ipw-killswitch \
	$(plugin)/hald-addon-leds \
	$(plugin)/hald-addon-omap-backlight \
	$(plugin)/hald-addon-pmu \
	$(plugin)/hald-addon-rfkill-killswitch \
	$(plugin)/hald-addon-storage \
	$(plugin)/hald-addon-usb-csr \
	$(plugin)/hald-generate-fdi-cache \
	$(plugin)/hald-probe-hiddev \
	$(plugin)/hald-probe-ieee1394-unit \
	$(plugin)/hald-probe-input \
	$(plugin)/hald-probe-net-bluetooth \
	$(plugin)/hald-probe-pc-floppy \
	$(plugin)/hald-probe-printer \
	$(plugin)/hald-probe-serial \
	$(plugin)/hald-probe-smbios \
	$(plugin)/hald-probe-storage \
	$(plugin)/hald-probe-video4linux \
	$(plugin)/hald-probe-volume \
	$(plugin)/hald-runner \
	$(prefix)/sbin/hald \

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
