CONFIG_ARCH := $(subst $(quote),,$(CONFIG_ARCH))
CONFIG_CPU := $(subst $(quote),,$(CONFIG_CPU))
CONFIG_ABI := $(subst $(quote),,$(CONFIG_ABI))

include $(if $(KBUILD_SRC),$(srctree)/arch/$(CONFIG_ARCH)/Makefile)

BUILD := $(shell echo $$MACHTYPE)
HOST := $(shell echo $$MACHTYPE)

prefix := $(CURDIR)/usr
PATH := $(prefix)/bin:$(PATH)
env := env -i PATH=$(PATH) LD_LIBRARY_PATH=$(prefix)/lib
export prefix PATH env

exec-prefix := $(prefix)/$(TARGET)
sysroot := $(exec-prefix)/sys-root

NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
export NUM_CPU
