PACKAGE = inputproto
VERSION = 2.3.2
LICENSE = custom

ifneq ($(MAKECMDGOALS),watch)
  ifeq ($(CONFIG_XORG_IEGD),y)
  VERSION = 1.5.1
  endif
endif

include packages/xorg/proto/common.mk
