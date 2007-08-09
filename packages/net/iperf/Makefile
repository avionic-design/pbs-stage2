PACKAGE = iperf
VERSION = 2.0.2

LOCATION = http://dast.nlanr.net/Projects/Iperf2.0
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

PATCHFILES = \
	$(DISTNAME)-define-rpl_malloc.patch

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CXX CFLAGS LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

