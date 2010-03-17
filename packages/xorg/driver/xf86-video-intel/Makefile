PACKAGE = xf86-video-intel
VERSION = 2.10.902

include packages/xorg/driver/common.mk

sdkdir := $(ROOTFS)$(prefix)/include/xorg
sdkdir := $(subst /,_,$(sdkdir))
sdkdir := $(subst .,_,$(sdkdir))

conf-vars += \
	ac_cv_file_$(sdkdir)_dri_h=yes \
	ac_cv_file_$(sdkdir)_dristruct_h=yes \
	ac_cv_file_$(sdkdir)_sarea_h=yes

prunefiles = \
	$(prefix)/lib/xorg/modules/drivers/intel_drv.la

stripfiles = \
	$(prefix)/lib/xorg/modules/drivers/intel_drv.so
