PACKAGE = xextproto
VERSION = 7.3.0

ifneq ($(MAKECMDGOALS),watch)
  ifeq ($(CONFIG_XORG_IEGD),y)
  VERSION = 7.0.5
  endif
endif

include packages/xorg/proto/common.mk
