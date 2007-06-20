PACKAGE = openntpd
VERSION = 3.9p1

LOCATION = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

env  = env -i
priv = sudo

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cp support/config.{guess,sub} $(pkgtree)
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	STRIP_OPT=''

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

