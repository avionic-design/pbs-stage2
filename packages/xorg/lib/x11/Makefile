PACKAGE = libX11
VERSION = 1.1.99.2

include packages/xorg/lib/Makefile

conf-args += \
	--disable-malloc0returnsnull

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

# build native utilities (they are built separately because they can't take
# cross-compiling compiler flags)
package-pre-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) -C src/util CPPFLAGS='' CFLAGS=''

prunefiles = \
	$(prefix)/lib/libX11-xcb.la \
	$(prefix)/lib/libX11.la

stripfiles = \
	$(prefix)/lib/libX11-xcb.so.1.0.0 \
	$(prefix)/lib/libX11.so.6.2.0

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

