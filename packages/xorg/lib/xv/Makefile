PACKAGE = libXv
VERSION = 1.0.5

include packages/xorg/lib/common.mk

conf-args += \
	--disable-malloc0returnsnull

#conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libXv.la

stripfiles = \
	$(prefix)/lib/libXv.so.1.0.0
