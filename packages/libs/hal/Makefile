PACKAGE = hal
VERSION = 0.5.11

LOCATION = http://hal.freedesktop.org/releases
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--libexecdir=$(prefix)/lib/hal \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--disable-policy-kit \
	--disable-pci-ids \
	--disable-usb-ids

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CPPFLAGS='$(CPPFLAGS)' \
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

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

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
	$(plugin)/hal-ipw-killswitch-linux \
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
	$(plugin)/hald-addon-hid-ups \
	$(plugin)/hald-addon-input \
	$(plugin)/hald-addon-omap-backlight \
	$(plugin)/hald-addon-pmu \
	$(plugin)/hald-addon-storage \
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

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

