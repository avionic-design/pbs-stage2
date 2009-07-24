include toolchains/common.mk

BUILD	:= $(shell echo $$MACHTYPE)
HOST	:= $(shell echo $$MACHTYPE)

PATH	:= $(SYSROOT)$(prefix)/bin:$(PATH)
env	:= env -i PATH=$(PATH)
export PATH env

prefix	:= $(SYSROOT)$(prefix)
SYSROOT	:=

ifneq ($(SYSROOT),)
  DESTDIR := $(SYSROOT)
else
  DESTDIR := /
endif
export DESTDIR
