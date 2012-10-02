PACKAGE = xf86-input-evdev
VERSION = 2.7.3
LICENSE = custom

include packages/xorg/driver/common.mk

ifneq ($(CONFIG_PACKAGE_XORG_DRIVER_XF86_INPUT_EVDEV_MULTITOUCH),y)
  conf-args += --disable-multitouch
endif

prunefiles = \
	$(prefix)/lib/xorg/modules/input/*.la

stripfiles = \
	$(prefix)/lib/xorg/modules/input/*.so
