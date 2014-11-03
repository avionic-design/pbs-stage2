PACKAGE = xf86-input-evdev
VERSION = 2.9.0
LICENSE = custom

BUILD_SCRIPT = autotools-reconf.mk
include packages/xorg/driver/common.mk

ifneq ($(CONFIG_PACKAGE_XORG_DRIVER_INPUT_EVDEV_MULTITOUCH),y)
  conf-args += --disable-multitouch
endif

prunefiles = \
	$(prefix)/lib/xorg/modules/input/*.la

stripfiles = \
	$(prefix)/lib/xorg/modules/input/*.so
