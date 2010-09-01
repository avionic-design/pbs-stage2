# Definitions for XDC based software
#
# TODO: Support other platforms than davinci dm365

XDC_TARGET_BASE     := gnu/targets
XDC_TARGET_HDR      := $(XDC_TARGET_BASE)/std.h
XDC_TARGET_NAME     := GCArmv5T
XDC_TARGET_INC_DIR  := $(XDC_TARGET_BASE)/arm
XDC_TARGET_FLAGS    := \
	-Dxdc_target_name__=$(XDC_TARGET_NAME) \
	-Dxdc_target_types__=$(XDC_TARGET_HDR) \

XDC_CPPFLAGS        := \
	$(XDC_TARGET_FLAGS) \
	-I$(SYSROOT)/$(prefix)/include/$(XDC_TARGET_INC_DIR)
