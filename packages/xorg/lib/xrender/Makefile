PACKAGE = libXrender
VERSION = 0.9.4

include packages/xorg/lib/Makefile

package-pre-configure:
	cp -f support/config.{guess,sub} $(pkgtree)

conf-args += \
	--disable-malloc0returnsnull

prunefiles = \
	$(prefix)/lib/libXrender.la

stripfiles = \
	$(prefix)/lib/libXrender.so.1.3.0

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

