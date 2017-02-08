PACKAGE = xf86-input-evdev
VERSION = 2.10.5
LICENSE = custom

BUILD_SCRIPT = autotools-reconf.mk
include packages/xorg/driver/common.mk

prunefiles = \
	$(prefix)/lib/xorg/modules/input/*.la

stripfiles = \
	$(prefix)/lib/xorg/modules/input/*.so
