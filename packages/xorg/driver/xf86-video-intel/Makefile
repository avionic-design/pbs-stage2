PACKAGE = xf86-video-intel
VERSION = 2.14.0

include packages/xorg/driver/common.mk

sdkdir := $(prefix)/include/xorg
sdkdir := $(subst /,_,$(sdkdir))
sdkdir := $(subst .,_,$(sdkdir))
sdkdir := $(subst -,_,$(sdkdir))

conf-vars += \
	ac_cv_file_$(sdkdir)_dri_h=yes \
	ac_cv_file_$(sdkdir)_dristruct_h=yes \
	ac_cv_file_$(sdkdir)_sarea_h=yes

prunefiles = \
	$(prefix)/lib/*.la \
	$(prefix)/lib/xorg/modules/drivers/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/xorg/modules/drivers/*.so
