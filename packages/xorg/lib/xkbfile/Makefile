PACKAGE = libxkbfile
VERSION = 1.0.5

include packages/xorg/lib/Makefile

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)'

#package-pre-configure:
#	chmod u+w $(pkgtree)/ltmain.sh
#	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-post-install:
	$(priv) rm $(ROOTFS)$(prefix)/lib/libxkbfile.la

