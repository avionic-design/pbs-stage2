include packages/buildroot/common.mk

HOST   ?= $(shell support/config.guess)
BUILD  ?= $(HOST)
TARGET ?= $(HOST)
ARCH   ?= $(shell echo $(TARGET) | cut -d- -f1)
prefix ?= $(toolchain-prefix)
env    ?= env -i PATH=$(ROOTFS)$(bootstrap-prefix)/bin:${PATH}

CROSS_COMPILE = $(ROOTFS)$(bootstrap-prefix)/bin/$(HOST)-
AR      = $(CROSS_COMPILE)ar
AS      = $(CROSS_COMPILE)as
CC      = $(CROSS_COMPILE)gcc
CPP     = $(CROSS_COMPILE)cpp
CXX     = $(CROSS_COMPILE)g++
LD      = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
RANLIB  = $(CROSS_COMPILE)ranlib
READELF = $(CROSS_COMPILE)readelf
STRIP   = $(CROSS_COMPILE)strip

CFLAGS   +=
CPPFLAGS +=
CXXFLAGS +=
LDFLAGS  +=

CROSS_TOOLS = \
	AR \
	AS \
	CC \
	CPP \
	CXX \
	LD \
	OBJCOPY \
	OBJDUMP \
	RANLIB \
	READELF \
	STRIP

CROSS_FLAGS = \
	CFLAGS \
	CPPFLAGS \
	CXXFLAGS \
	LDFLAGS

