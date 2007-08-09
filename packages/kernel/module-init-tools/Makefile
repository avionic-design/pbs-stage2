PACKAGE = module-init-tools
VERSION = 3.2

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/module-init-tools
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/ \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cp support/config.{guess,sub} $(pkgtree)
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

