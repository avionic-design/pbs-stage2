PACKAGE = hal
VERSION = 0.5.14

LOCATION = http://hal.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/hal \
	--with-udev-prefix=/lib

conf-args += \
	--disable-policy-kit \
	--disable-pci-ids \
	--disable-usb-ids

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
