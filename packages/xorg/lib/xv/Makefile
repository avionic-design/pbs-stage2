PACKAGE = libXv
VERSION = 1.0.4

include packages/xorg/lib/Makefile

conf-args += \
	--disable-malloc0returnsnull

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libXv.la

stripfiles = \
	$(prefix)/lib/libXv.so.1.0.0

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

