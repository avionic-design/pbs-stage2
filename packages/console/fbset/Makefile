PACKAGE = fbset
VERSION = 2.1

LOCATION = http://users.telenet.be/geertu/Linux/fbdev
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = framebuffer device maintenance program

##############################################################################

include packages/common.mk

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

