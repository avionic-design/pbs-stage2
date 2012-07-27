PACKAGE = xf86-video-intel
VERSION = 2.20.1
LICENSE = custom

include packages/xorg/driver/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_XORG_DRIVER_VIDEO_INTEL_DEBUG),y)
  conf-args += --enable-debug=full
endif

prunefiles = \
	$(prefix)/lib/*.la \
	$(prefix)/lib/xorg/modules/drivers/*.la

ifneq ($(CONFIG_PACKAGE_XORG_DRIVER_VIDEO_INTEL_DEBUG),y)
stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/xorg/modules/drivers/*.so
endif
