CORE_PREFIX = $(PLATFORM)$(prefix)
BUILD = $(shell echo $$MACHTYPE)
HOST = $(shell echo $$MACHTYPE)
#PATH = $(PLATFORM)/usr/bin:$(CORE_PREFIX)/bin:/usr/bin:/bin

ifeq ($(variant),sysroot)
  PATH   := $(PLATFORM)/usr/bin:$(PATH)
  prefix  = /usr
  priv    =
else
  prefix = /opt/cross
  priv   = sudo
endif

env = PATH=$(PATH)

