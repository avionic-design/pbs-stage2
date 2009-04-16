PACKAGE = libpciaccess
VERSION = 0.10.5

include packages/xorg/lib/common.mk

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libpciaccess.la

stripfiles = \
	$(prefix)/lib/libpciaccess.so.0.10.2

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

