PACKAGE = libXfont
VERSION = 1.4.0

include packages/xorg/lib/common.mk

conf-args += \
	--disable-freetype

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

prunefiles = \
	$(prefix)/lib/libXfont.la

stripfiles = \
	$(prefix)/lib/libXfont.so.1.4.1

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

