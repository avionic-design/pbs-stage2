PACKAGE = grep
VERSION = 2.5.1a

LOCATION = ftp://ftp.cs.tu-berlin.de/pub/gnu/grep
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--bindir=/bin \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--disable-nls \
	$(call set-args, CC CFLAGS) \
	ac_cv_func_mempcpy=no

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

