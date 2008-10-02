PACKAGE = libXrender
VERSION = 0.9.4

include packages/xorg/lib/Makefile

package-pre-configure:
	chmod u+w $(pkgtree)/config.sub
	cp support/config.sub $(pkgtree)/config.sub
	chmod u+w $(pkgtree)/ltmain.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

conf-args += \
	--disable-malloc0returnsnull

prunefiles = \
	$(prefix)/lib/libXrender.la

stripfiles = \
	$(prefix)/lib/libXrender.so.1.3.0

include packages/cleanup.mk

package-post-install: _cleanup
	@:

