PACKAGE = libxcb
VERSION = 1.7

LOCATION = http://xcb.freedesktop.org/dist

include packages/xorg/lib/common.mk

env += \
	LD_LIBRARY_PATH=$(objtree)/build-tools/lib

prunefiles = \
	$(prefix)/lib/*la

stripfiles = \
	$(prefix)/lib/*.so.*
