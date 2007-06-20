PACKAGE = sysfsutils
VERSION = 2.1.0

LOCATION = http://ovh.dl.sourceforge.net/sourceforge/linux-diag
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--mandir=\$${prefix}/share/man \
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
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

