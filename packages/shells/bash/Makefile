PACKAGE = bash
VERSION = 3.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/bash
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

env = env -i PATH=/bin:/usr/bin $(call set-args, CC CFLAGS LDFLAGS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--bindir=/bin \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--disable-nls

package-configure:
	cp support/config.{guess,sub} $(pkgtree)/support
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) ln -sf bash $(ROOTFS)/bin/sh

