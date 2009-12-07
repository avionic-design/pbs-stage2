PACKAGE = xf86-video-psb
VERSION = 0.31.0

include packages/xorg/driver/common.mk

conf-args += \
	--with-sdkdir=$(prefix)/include/xorg

prunefiles = \
	$(prefix)/lib/xorg/modules/drivers/libmm.la \
	$(prefix)/lib/xorg/modules/drivers/psb_drv.la

stripfiles = \
	$(prefix)/lib/xorg/modules/drivers/libmm.so \
	$(prefix)/lib/xorg/modules/drivers/psb_drv.so
