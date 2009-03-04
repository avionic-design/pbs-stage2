PACKAGE = libXext
VERSION = 1.0.5

include packages/xorg/lib/Makefile

conf-args += \
	--disable-malloc0returnsnull

conf-vars += \
	CC='$(CC) --sysroot=$(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libXext.la

stripfiles = \
	$(prefix)/lib/libXext.so.6.4.0

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

