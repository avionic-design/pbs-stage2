PACKAGE = fixesproto
VERSION = 5.0

ifneq ($(MAKECMDGOALS),watch)
  ifeq ($(CONFIG_XORG_IEGD),y)
  VERSION = 4.0
  endif
endif

include packages/xorg/proto/common.mk
