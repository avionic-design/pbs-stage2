PACKAGE = xf86-input-evtouch
VERSION = 0.8.8

LOCATION = http://www.conan.de/touchscreen

include packages/xorg/driver/common.mk

conf-args += \
	--enable-evcalibrate \
	--enable-udevinstall

prunefiles = \
	$(prefix)/lib/xorg/modules/input/evtouch_drv.la

stripfiles = \
	$(prefix)/lib/xorg/modules/input/evtouch_drv.so
