PACKAGE = xf86-video-intel
VERSION = 2.20.9
LICENSE = custom

include packages/xorg/driver/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_XORG_DRIVER_VIDEO_INTEL_SNA),y)
  conf-args += --with-default-accel=sna
endif

ifeq ($(CONFIG_PACKAGE_XORG_DRIVER_VIDEO_INTEL_UXA),y)
  conf-args += --with-default-accel=uxa
endif

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
