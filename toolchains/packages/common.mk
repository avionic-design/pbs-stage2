include toolchains/common.mk

BUILD	:= $(shell echo $$MACHTYPE)
HOST	:= $(shell echo $$MACHTYPE)

PATH	:= $(SYSROOT)$(prefix)/bin:$(PATH)
env	:= env -i PATH=$(PATH) LD_LIBRARY_PATH=$(SYSROOT)$(prefix)/lib
export PATH env

prefix	:= $(SYSROOT)$(prefix)
SYSROOT	:=

ifneq ($(SYSROOT),)
  DESTDIR := $(SYSROOT)
else
  DESTDIR := /
endif
export DESTDIR

NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
export NUM_CPU
