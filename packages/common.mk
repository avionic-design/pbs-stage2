# common definitions for packages

INSTALL = /usr/bin/install

CC     = $(CROSS_COMPILE)gcc
CXX    = $(CROSS_COMPILE)g++
LD     = $(CROSS_COMPILE)ld
AS     = $(CROSS_COMPILE)as
AR     = $(CROSS_COMPILE)ar
RANLIB = $(CROSS_COMPILE)ranlib
STRIP  = $(CROSS_COMPILE)strip

set-args = $(foreach arg, $(1), $(arg)='$($(arg))')

