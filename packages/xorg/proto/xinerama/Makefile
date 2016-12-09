PACKAGE = xineramaproto
VERSION = 1.2.1

ifneq ($(MAKECMDGOALS),watch)
  ifeq ($(CONFIG_XORG_IEGD),y)
  VERSION = 1.1.2
  endif
endif

include packages/xorg/proto/common.mk
