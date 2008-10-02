PACKAGE = libxkbfile
VERSION = 1.0.5

include packages/xorg/lib/Makefile

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libxkbfile.la

stripfiles = \
	$(prefix)/lib/libxkbfile.so.1.0.2

include packages/cleanup.mk

package-post-install: _cleanup
	@:

