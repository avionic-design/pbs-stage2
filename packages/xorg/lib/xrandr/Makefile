PACKAGE = libXrandr
VERSION = 1.3.2

include packages/xorg/lib/common.mk

conf-args += \
	--disable-malloc0returnsnull

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
