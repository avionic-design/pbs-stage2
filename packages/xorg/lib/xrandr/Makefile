PACKAGE = libXrandr
VERSION = 1.4.0
LICENSE = custom

include packages/xorg/lib/common.mk

conf-args += \
	--disable-malloc0returnsnull

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
