include packages/buildroot/common.mk

prefix = /tools

CROSS_COMPILE = $(ROOTFS)/tools/bin/
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

CFLAGS   = --sysroot $(ROOTFS)
CXXFLAGS = --sysroot $(ROOTFS)
LDFLAGS  = --sysroot $(ROOTFS)

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

