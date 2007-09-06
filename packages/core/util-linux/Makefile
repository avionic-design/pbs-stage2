PACKAGE = util-linux
VERSION = 2.12r

LOCATION = http://www.kernel.org/pub/linux/utils/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DOTCONFIG = packages/$(package)/$(PACKAGE_FULLNAME)

DESCRIPTION = miscellaneous system utilities

##############################################################################

include packages/common.mk

LDFLAGS := $(CFLAGS) $(LDFLAGS)
CFLAGS  += -I../lib
env      = env -i $(call set-args, CC CFLAGS LDFLAGS)

conf-args =
package-configure:
	cp $(DOTCONFIG) $(pkgtree)/MCONFIG
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) ln -sf agetty $(ROOTFS)/sbin/getty

package-clean:
	@:

