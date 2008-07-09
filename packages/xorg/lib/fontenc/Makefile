PACKAGE = libfontenc
VERSION = 1.0.4

include packages/xorg/lib/Makefile

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

package-post-install:
	$(priv) rm $(ROOTFS)$(prefix)/lib/libfontenc.la

