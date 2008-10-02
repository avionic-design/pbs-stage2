PACKAGE = libfontenc
VERSION = 1.0.4

include packages/xorg/lib/Makefile

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libfontenc.la

stripfiles = \
	$(prefix)/lib/libfontenc.so.1.0.0

include packages/cleanup.mk

package-post-install: _cleanup

